import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor {
  var currentValue : Float = 300;
  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  

  public func topUp(amount:Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount:Float){
    let tempAmount : Float = currentValue - amount;
    if(tempAmount >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Current value less tahn 0");
    } 
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };
  
  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue*(1.01**(Float.fromInt(timeElapsedS)));
    startTime := currentTime;
  }
};
