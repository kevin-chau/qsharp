
%Result = type opaque
%Qubit = type opaque
%Array = type opaque
%String = type opaque

define internal %Result* @QuantumOneQubit__main__body() {
entry:
  %q = call %Qubit* @__quantum__rt__qubit_allocate()
  %c = call %Result* @Microsoft__Quantum__Intrinsic__M__body(%Qubit* %q)
  call void @__quantum__rt__qubit_release(%Qubit* %q)
  ret %Result* %c
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

define internal %Result* @Microsoft__Quantum__Intrinsic__M__body(%Qubit* %qubit) {
entry:
  %bases = call %Array* @__quantum__rt__array_create_1d(i32 1, i64 1)
  %0 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %bases, i64 0)
  %1 = bitcast i8* %0 to i2*
  store i2 -2, i2* %1, align 1
  call void @__quantum__rt__array_update_alias_count(%Array* %bases, i32 1)
  %qubits = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %2 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %qubits, i64 0)
  %3 = bitcast i8* %2 to %Qubit**
  store %Qubit* %qubit, %Qubit** %3, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %qubits, i32 1)
  %4 = call %Result* @__quantum__qis__measure__body(%Array* %bases, %Array* %qubits)
  call void @__quantum__rt__array_update_alias_count(%Array* %bases, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %qubits, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %bases, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %qubits, i32 -1)
  ret %Result* %4
}

declare %Array* @__quantum__rt__array_create_1d(i32, i64)

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)

declare void @__quantum__rt__array_update_alias_count(%Array*, i32)

declare %Result* @__quantum__qis__measure__body(%Array*, %Array*)

declare void @__quantum__rt__array_update_reference_count(%Array*, i32)

define internal %Result* @Microsoft__Quantum__Intrinsic__Measure__body(%Array* %bases, %Array* %qubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %bases, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %qubits, i32 1)
  %0 = call %Result* @__quantum__qis__measure__body(%Array* %bases, %Array* %qubits)
  call void @__quantum__rt__array_update_alias_count(%Array* %bases, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %qubits, i32 -1)
  ret %Result* %0
}

define i8 @QuantumOneQubit__main__Interop() #0 {
entry:
  %0 = call %Result* @QuantumOneQubit__main__body()
  %1 = call %Result* @__quantum__rt__result_get_zero()
  %2 = call i1 @__quantum__rt__result_equal(%Result* %0, %Result* %1)
  %3 = select i1 %2, i8 0, i8 -1
  call void @__quantum__rt__result_update_reference_count(%Result* %0, i32 -1)
  ret i8 %3
}

declare %Result* @__quantum__rt__result_get_zero()

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

define void @QuantumOneQubit__main() #1 {
entry:
  %0 = call %Result* @QuantumOneQubit__main__body()
  %1 = call %String* @__quantum__rt__result_to_string(%Result* %0)
  call void @__quantum__rt__message(%String* %1)
  call void @__quantum__rt__result_update_reference_count(%Result* %0, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %1, i32 -1)
  ret void
}

declare void @__quantum__rt__message(%String*)

declare %String* @__quantum__rt__result_to_string(%Result*)

declare void @__quantum__rt__string_update_reference_count(%String*, i32)

attributes #0 = { "InteropFriendly" }
attributes #1 = { "EntryPoint" }
