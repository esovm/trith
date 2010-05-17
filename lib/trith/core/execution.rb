module Trith; module Core
  ##
  # Execution control operators.
  module Execution
    ##
    # @return [Machine]
    def nop
      self # do nothing
    end
    alias_method :';', :nop
    alias_method :',', :nop

    ##
    # @return [Machine]
    def halt
      @queue.clear
      self
    end

    ##
    # @return [Machine]
    def reset
      @stack.clear
      @queue.clear
      self
    end

    ##
    # @return [Machine]
    def quote
      push([shift])
    end
    alias_method :'\\', :quote
    alias_method :"'", :quote

    ##
    # @return [Machine]
    def call(quot)
      case quot
        when Array
          execute(quot)
        when Symbol
          execute([quot]) # FIXME
        else # TODO: error
      end
      self
    end

    ##
    # @return [Machine]
    def stack_
      @stack = [@stack]
      self
    end

    ##
    # @param  [#to_a, #each]
    # @return [Machine]
    def unstack(seq)
      @stack = case seq
        when String then seq.each_char.to_a
        when Array  then seq
        else case
          when seq.respond_to?(:to_a) then seq.to_a
          when seq.respond_to?(:each) then seq.each.to_a
          else raise Machine::InvalidOperandError.new(seq, :unstack)
        end
      end
      self
    end

    ##
    # @return [Machine]
    def times(quot, count)
      case quot
        when Array
          count.to_i.times { execute(quot) }
        when Symbol
          count.to_i.times { execute([quot]) } # FIXME
        else # TODO: error
      end
      self
    end

    ##
    # @return [Machine]
    def twice(quot)
      case quot
        when Array
          2.times { execute(quot) }
        when Symbol
          2.times { execute([quot]) } # FIXME
        else # TODO: error
      end
      self
    end

    ##
    # @return [Machine]
    def thrice(quot)
      case quot
        when Array
          3.times { execute(quot) }
        when Symbol
          3.times { execute([quot]) } # FIXME
        else # TODO: error
      end
      self
    end

    ##
    # @return [Machine]
    def loop(quot)
      case quot
        when Array
          execute([quot, :loop])
          execute(quot)
        when Symbol
          execute([quot, :quote, quot, :loop]) # FIXME
        else # TODO: error
      end
      self
    end

    ##
    # @return [Machine]
    def while(quot, cond)
      with_saved_continuation(:while) do
        Kernel.loop do
          execute(cond)
          case pop
            when false, nil then break
            else execute(quot)
          end
        end
      end
      self
    end

    ##
    # @return [Machine]
    def until(quot, cond)
      with_saved_continuation(:until) do
        Kernel.loop do
          execute(cond)
          case pop
            when false, nil then execute(quot)
            else break
          end
        end
      end
      self
    end

    ##
    # @return [Machine]
    def branch(cond, thenop, elseop)
      case cond
        when false, nil then execute(elseop)
        else execute(thenop)
      end
      self
    end
    alias_method :if, :branch

    ##
    # @return [Machine]
    def when(cond, quot)
      case cond
        when false, nil then # nop
        else execute(quot)
      end
      self
    end

    ##
    # @return [Machine]
    def unless(cond, quot)
      case cond
        when false, nil then execute(quot)
        else # nop
      end
      self
    end

    ##
    # @return [Machine]
    def print(obj)
      $stdout.puts(obj) # FIXME
      self
    end
    alias_method :'.', :print
  end # module Execution
end; end # module Trith::Core
