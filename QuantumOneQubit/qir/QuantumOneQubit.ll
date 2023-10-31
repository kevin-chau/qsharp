
%Qubit = type opaque
%Array = type opaque
%String = type opaque

@0 = internal constant [3 x i8] c"()\00"

define internal void @QuantumOneQubit__main__body() {
entry:
  %q = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__rt__qubit_release(%Qubit* %q)
  ret void
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

define void @QuantumOneQubit__main__Interop() #0 {
entry:
  call void @QuantumOneQubit__main__body()
  ret void
}

define void @QuantumOneQubit__main() #1 {
entry:
  call void @QuantumOneQubit__main__body()
  %0 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0))
  call void @__quantum__rt__message(%String* %0)
  call void @__quantum__rt__string_update_reference_count(%String* %0, i32 -1)
  ret void
}

declare void @__quantum__rt__message(%String*)

declare %String* @__quantum__rt__string_create(i8*)

declare void @__quantum__rt__string_update_reference_count(%String*, i32)

attributes #0 = { "InteropFriendly" }
attributes #1 = { "EntryPoint" }
