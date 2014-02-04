unit TestuStack;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework{$IFNDEF VER130}, Variants{$EndIf}, uStack;

type
  // Test methods for class TStack

  TestTStack = class(TTestCase)
  private
    FStack: IStack;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCapacity;
    procedure TestEmpty;
    procedure TestGrowCapacityBy;
    procedure TestPeek;
    procedure TestPop;
    procedure TestPush;
    procedure TestSize;
  end;

implementation

procedure TestTStack.SetUp;
begin
  FStack := NewStack;
end;

procedure TestTStack.TearDown;
begin
  FStack := nil;
end;

procedure TestTStack.TestCapacity;
begin
  FStack.Capacity := 10;
  CheckEquals(10, FStack.Capacity, 'Capacity of stack should be equals to 10');
  FStack.Push(1);
  FStack.Capacity := 0;
  CheckEquals(0, FStack.Capacity, 'Capacity of stack should be equals to 0');
  Check(FStack.Empty, 'Stack should be empty');
end;

procedure TestTStack.TestEmpty;
begin
  Check(FStack.Empty, 'Stack should be empty');
  FStack.Push(1);
  Check(not FStack.Empty, 'Stack should not be empty');
  FStack.Pop;
  Check(FStack.Empty, 'Stack should be empty');
end;

procedure TestTStack.TestGrowCapacityBy;
var
  i : integer;
begin
  FStack.GrowCapacityBy := 1;
  for I := 1 to 20 do
    begin
      FStack.Push(i);
    end;
  for I := 20 downto 1 do
    begin
      CheckEquals(i, FStack.Pop, 'Value of Pop doesn''t match');
    end;
end;

procedure TestTStack.TestPeek;
var
  ReturnValue: Variant;
begin
  ReturnValue := FStack.Push(5);
  CheckEquals(5, ReturnValue, 'Return value of push didn''t match');
  ReturnValue := FStack.Peek;
  CheckEquals(5, ReturnValue, 'Return value of push didn''t match');
  ReturnValue := FStack.Peek;
  CheckEquals(5, ReturnValue, 'Return value of push didn''t match');
end;

procedure TestTStack.TestPop;
var
  ReturnValue: Variant;
begin
  ReturnValue := FStack.Push(5);
  CheckEquals(5, ReturnValue, 'Return value of push didn''t match');
  ReturnValue := FStack.Pop;
  CheckEquals(5, ReturnValue, 'Return value of push didn''t match');
end;

procedure TestTStack.TestPush;
var
  ReturnValue: Variant;
begin
  ReturnValue := FStack.Push(5);
  CheckEquals(5, ReturnValue, 'Return value of push didn''t match');
  ReturnValue := FStack.Push(6);
  CheckEquals(6, ReturnValue, 'Return value of push didn''t match');
end;

procedure TestTStack.TestSize;
begin
  CheckEquals(0, FStack.Size, 'Initial size should be zero');
  FStack.Push(1);
  CheckEquals(1, FStack.Size, 'Size should be one after first insertion');
  FStack.Push(2);
  CheckEquals(2, FStack.Size, 'Size should be two after second insertion');
  FStack.Size := 1;
  CheckEquals(1, FStack.Size, 'Size should be one after setting to one');
  FStack.Capacity := 0;
  CheckEquals(0, FStack.Size, 'Size should be zero after setting capacity to zero');
  FStack.Push(1);
  CheckEquals(1, FStack.Size, 'Size should be one after a new insertion');
  FStack.Pop;
  CheckEquals(0, FStack.Size, 'Size should be zero after pop operation');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTStack.Suite);
end.

