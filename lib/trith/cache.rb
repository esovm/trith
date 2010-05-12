module Trith
  ##
  # The Trith code cache.
  class Cache < RDF::Repository
    include RDF::Repository::Implementation rescue nil

    ##
    # @param  [Array<String>] filenames
    # @return [Trith::Cache]
    def self.load(*filenames)
      self.new do |repository|
        filenames.each do |filename|
          repository.load(filename)
        end
      end
    end

    ##
    # @param  [Hash{Symbol => Object} options
    def initialize(options = {}, &block)
      @data = []
      super(options, &block)
    end

    ##
    # Enumerates each function in the cache.
    #
    # @return [Enumerator<Trith::Function>]
    def each_function(&block)
      unless block_given?
        Enumerator.new(self, :each_function)
      else
        query(:predicate => RDF.type, :object => Trith::Function::URI) do |statement|
          block.call(Trith::Function.new(statement.subject, :data => self))
        end
      end
    end

    ##
    # Finds functions fulfilling the given criteria.
    #
    # @param  [Hash{Symbol => Object}] options
    # @option options [Symbol, #to_s]  :label
    # @return [Enumerator<Trith::Function>]
    def find_functions(options = {}, &block)
      unless block_given?
        Enumerator.new(self, :find_functions, options)
      else
        # FIXME: would really need BGP query support in RDF.rb...
        each_function do |function|
          if options.empty?
            block.call(function)
          else
            pattern = case
              when options[:label]
                {:predicate => RDF::RDFS.label, :object => options[:label].to_s}
              else {}
            end
            block.call(function) unless query({:subject => function.id}.merge(pattern)).empty?
          end
        end
      end
    end
  end
end
