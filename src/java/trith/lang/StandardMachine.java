package trith.lang;
import  java.util.concurrent.ExecutorService;
import  java.util.concurrent.Future;

/**
 * @author Arto Bendiken
 */
public class StandardMachine extends AbstractMachine {
  protected final AbstractMachine machine;

  protected ExecutorService getExecutor() {
    return machine.getExecutor();
  }

  public StandardMachine() {
    this(new SequentialMachine());
  }

  public StandardMachine(int concurrencyLevel) {
    this(new ParallelMachine(concurrencyLevel));
  }

  public StandardMachine(AbstractMachine machine) {
    this.machine = machine;
  }

  public Future peek() {
    return machine.peek();
  }

  public Future pop() {
    return machine.pop();
  }

  public void push(Future value) {
    machine.push(value);
  }

  /**
   * @see trith.core.dup
   */
  public void dup() {
    execute(new trith.core.dup());
  }

  /*
   * @see trith.math.neg
   */
  public void neg() {
    execute(new trith.math.neg());
  }

  /*
   * @see trith.math.add
   */
  public void add() {
    execute(new trith.math.add());
  }

  /*
   * @see trith.math.sub
   */
  public void sub() {
    execute(new trith.math.sub());
  }

  /*
   * @see trith.math.mul
   */
  public void mul() {
    execute(new trith.math.mul());
  }

  /*
   * @see trith.math.div
   */
  public void div() {
    execute(new trith.math.div());
  }

  /*
   * @see trith.math.rem
   */
  public void rem() {
    execute(new trith.math.rem());
  }

  /*
   * @see trith.math.mod
   */
  public void mod() {
    execute(new trith.math.mod());
  }

  /*
   * @see trith.math.pow
   */
  public void pow() {
    execute(new trith.math.pow());
  }
}
