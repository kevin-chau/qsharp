
%Tuple = type opaque
%Result = type opaque
%Qubit = type opaque
%Array = type opaque
%String = type opaque
%Callable = type opaque

@0 = internal constant [40 x i8] c"Sampling a random number between 0 and \00"
@1 = internal constant [3 x i8] c": \00"
@2 = internal constant [25 x i8] c"`a` must be non-negative\00"
@3 = internal constant [46 x i8] c"`Length(bits)` must be less than 64, but was \00"
@4 = internal constant [2 x i8] c".\00"
@Microsoft__Quantum__Convert__ResultAsBool__FunctionTable = internal constant [4 x void (%Tuple*, %Tuple*, %Tuple*)*] [void (%Tuple*, %Tuple*, %Tuple*)* @Microsoft__Quantum__Convert__ResultAsBool__body__wrapper, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null, void (%Tuple*, %Tuple*, %Tuple*)* null]

define internal %Result* @QuantumRNGComplex__GenerateRandomBit__body() {
entry:
  %q = call %Qubit* @__quantum__rt__qubit_allocate()
  call void @__quantum__qis__h__body(%Qubit* %q)
  %0 = call %Result* @Microsoft__Quantum__Intrinsic__M__body(%Qubit* %q)
  call void @__quantum__rt__qubit_release(%Qubit* %q)
  ret %Result* %0
}

declare %Qubit* @__quantum__rt__qubit_allocate()

declare %Array* @__quantum__rt__qubit_allocate_array(i64)

declare void @__quantum__rt__qubit_release(%Qubit*)

declare void @__quantum__qis__h__body(%Qubit*)

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

define internal i64 @QuantumRNGComplex__SampleRandomNumber__body() {
entry:
  %0 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @0, i32 0, i32 0))
  %1 = call %String* @__quantum__rt__int_to_string(i64 50)
  %2 = call %String* @__quantum__rt__string_concatenate(%String* %0, %String* %1)
  call void @__quantum__rt__string_update_reference_count(%String* %0, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %1, i32 -1)
  %3 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @1, i32 0, i32 0))
  %4 = call %String* @__quantum__rt__string_concatenate(%String* %2, %String* %3)
  call void @__quantum__rt__string_update_reference_count(%String* %2, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %3, i32 -1)
  call void @__quantum__rt__message(%String* %4)
  %5 = call i64 @QuantumRNGComplex__SampleRandomNumberInRange__body(i64 50)
  call void @__quantum__rt__string_update_reference_count(%String* %4, i32 -1)
  ret i64 %5
}

declare %String* @__quantum__rt__string_create(i8*)

declare void @__quantum__rt__string_update_reference_count(%String*, i32)

declare %String* @__quantum__rt__int_to_string(i64)

declare %String* @__quantum__rt__string_concatenate(%String*, %String*)

declare void @__quantum__rt__message(%String*)

define internal i64 @QuantumRNGComplex__SampleRandomNumberInRange__body(i64 %max) {
entry:
  %bits = alloca %Array*, align 8
  %output = alloca i64, align 8
  store i64 0, i64* %output, align 4
  br label %repeat__1

repeat__1:                                        ; preds = %exit__6, %entry
  %0 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 0)
  store %Array* %0, %Array** %bits, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %0, i32 1)
  %1 = call i64 @Microsoft__Quantum__Math__BitSizeI__body(i64 %max)
  br label %header__1

until__1:                                         ; preds = %exit__1
  %2 = icmp sle i64 %18, %max
  br i1 %2, label %rend__1, label %fixup__1

fixup__1:                                         ; preds = %until__1
  call void @__quantum__rt__array_update_alias_count(%Array* %17, i32 -1)
  %3 = call i64 @__quantum__rt__array_get_size_1d(%Array* %17)
  %4 = sub i64 %3, 1
  br label %header__6

rend__1:                                          ; preds = %until__1
  call void @__quantum__rt__array_update_alias_count(%Array* %17, i32 -1)
  %5 = call i64 @__quantum__rt__array_get_size_1d(%Array* %17)
  %6 = sub i64 %5, 1
  br label %header__5

header__1:                                        ; preds = %exiting__1, %repeat__1
  %idxBit = phi i64 [ 1, %repeat__1 ], [ %16, %exiting__1 ]
  %7 = icmp sle i64 %idxBit, %1
  br i1 %7, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %8 = load %Array*, %Array** %bits, align 8
  %9 = call %Result* @QuantumRNGComplex__GenerateRandomBit__body()
  %10 = call %Array* @__quantum__rt__array_create_1d(i32 8, i64 1)
  %11 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %10, i64 0)
  %12 = bitcast i8* %11 to %Result**
  store %Result* %9, %Result** %12, align 8
  %13 = call %Array* @__quantum__rt__array_concatenate(%Array* %8, %Array* %10)
  %14 = call i64 @__quantum__rt__array_get_size_1d(%Array* %13)
  %15 = sub i64 %14, 1
  br label %header__2

exiting__1:                                       ; preds = %exit__4
  %16 = add i64 %idxBit, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %17 = load %Array*, %Array** %bits, align 8
  %18 = call i64 @Microsoft__Quantum__Convert__ResultArrayAsInt__body(%Array* %17)
  store i64 %18, i64* %output, align 4
  br label %until__1

header__2:                                        ; preds = %exiting__2, %body__1
  %19 = phi i64 [ 0, %body__1 ], [ %24, %exiting__2 ]
  %20 = icmp sle i64 %19, %15
  br i1 %20, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %21 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %13, i64 %19)
  %22 = bitcast i8* %21 to %Result**
  %23 = load %Result*, %Result** %22, align 8
  call void @__quantum__rt__result_update_reference_count(%Result* %23, i32 1)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %24 = add i64 %19, 1
  br label %header__2

exit__2:                                          ; preds = %header__2
  call void @__quantum__rt__array_update_reference_count(%Array* %13, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %13, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %8, i32 -1)
  %25 = call i64 @__quantum__rt__array_get_size_1d(%Array* %8)
  %26 = sub i64 %25, 1
  br label %header__3

header__3:                                        ; preds = %exiting__3, %exit__2
  %27 = phi i64 [ 0, %exit__2 ], [ %32, %exiting__3 ]
  %28 = icmp sle i64 %27, %26
  br i1 %28, label %body__3, label %exit__3

body__3:                                          ; preds = %header__3
  %29 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %8, i64 %27)
  %30 = bitcast i8* %29 to %Result**
  %31 = load %Result*, %Result** %30, align 8
  call void @__quantum__rt__result_update_reference_count(%Result* %31, i32 -1)
  br label %exiting__3

exiting__3:                                       ; preds = %body__3
  %32 = add i64 %27, 1
  br label %header__3

exit__3:                                          ; preds = %header__3
  call void @__quantum__rt__array_update_reference_count(%Array* %8, i32 -1)
  store %Array* %13, %Array** %bits, align 8
  br label %header__4

header__4:                                        ; preds = %exiting__4, %exit__3
  %33 = phi i64 [ 0, %exit__3 ], [ %38, %exiting__4 ]
  %34 = icmp sle i64 %33, 0
  br i1 %34, label %body__4, label %exit__4

body__4:                                          ; preds = %header__4
  %35 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %10, i64 %33)
  %36 = bitcast i8* %35 to %Result**
  %37 = load %Result*, %Result** %36, align 8
  call void @__quantum__rt__result_update_reference_count(%Result* %37, i32 -1)
  br label %exiting__4

exiting__4:                                       ; preds = %body__4
  %38 = add i64 %33, 1
  br label %header__4

exit__4:                                          ; preds = %header__4
  call void @__quantum__rt__array_update_reference_count(%Array* %10, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %13, i32 -1)
  br label %exiting__1

header__5:                                        ; preds = %exiting__5, %rend__1
  %39 = phi i64 [ 0, %rend__1 ], [ %44, %exiting__5 ]
  %40 = icmp sle i64 %39, %6
  br i1 %40, label %body__5, label %exit__5

body__5:                                          ; preds = %header__5
  %41 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 %39)
  %42 = bitcast i8* %41 to %Result**
  %43 = load %Result*, %Result** %42, align 8
  call void @__quantum__rt__result_update_reference_count(%Result* %43, i32 -1)
  br label %exiting__5

exiting__5:                                       ; preds = %body__5
  %44 = add i64 %39, 1
  br label %header__5

exit__5:                                          ; preds = %header__5
  call void @__quantum__rt__array_update_reference_count(%Array* %17, i32 -1)
  %45 = load i64, i64* %output, align 4
  ret i64 %45

header__6:                                        ; preds = %exiting__6, %fixup__1
  %46 = phi i64 [ 0, %fixup__1 ], [ %51, %exiting__6 ]
  %47 = icmp sle i64 %46, %4
  br i1 %47, label %body__6, label %exit__6

body__6:                                          ; preds = %header__6
  %48 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %17, i64 %46)
  %49 = bitcast i8* %48 to %Result**
  %50 = load %Result*, %Result** %49, align 8
  call void @__quantum__rt__result_update_reference_count(%Result* %50, i32 -1)
  br label %exiting__6

exiting__6:                                       ; preds = %body__6
  %51 = add i64 %46, 1
  br label %header__6

exit__6:                                          ; preds = %header__6
  call void @__quantum__rt__array_update_reference_count(%Array* %17, i32 -1)
  br label %repeat__1
}

declare %Array* @__quantum__rt__array_create_1d(i32, i64)

declare void @__quantum__rt__array_update_alias_count(%Array*, i32)

define internal i64 @Microsoft__Quantum__Math__BitSizeI__body(i64 %a) {
entry:
  %0 = icmp sge i64 %a, 0
  %1 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @2, i32 0, i32 0))
  call void @Microsoft__Quantum__Diagnostics__Fact__body(i1 %0, %String* %1)
  %2 = icmp eq i64 %a, 0
  br i1 %2, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %entry
  br label %condContinue__1

condFalse__1:                                     ; preds = %entry
  %3 = call i64 @Microsoft__Quantum__Math____QsRef2__AccumulatedBitsizeI____body(i64 %a, i64 0)
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %4 = phi i64 [ 1, %condTrue__1 ], [ %3, %condFalse__1 ]
  call void @__quantum__rt__string_update_reference_count(%String* %1, i32 -1)
  ret i64 %4
}

declare i8* @__quantum__rt__array_get_element_ptr_1d(%Array*, i64)

declare %Array* @__quantum__rt__array_concatenate(%Array*, %Array*)

declare i64 @__quantum__rt__array_get_size_1d(%Array*)

declare void @__quantum__rt__result_update_reference_count(%Result*, i32)

declare void @__quantum__rt__array_update_reference_count(%Array*, i32)

define internal i64 @Microsoft__Quantum__Convert__ResultArrayAsInt__body(%Array* %results) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %results, i32 1)
  %0 = call %Array* @Microsoft__Quantum__Convert__ResultArrayAsBoolArray__body(%Array* %results)
  %1 = call i64 @Microsoft__Quantum__Convert__BoolArrayAsInt__body(%Array* %0)
  call void @__quantum__rt__array_update_alias_count(%Array* %results, i32 -1)
  call void @__quantum__rt__array_update_reference_count(%Array* %0, i32 -1)
  ret i64 %1
}

define internal void @Microsoft__Quantum__Intrinsic__H__body(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__adj(%Qubit* %qubit) {
entry:
  call void @__quantum__qis__h__body(%Qubit* %qubit)
  ret void
}

define internal void @Microsoft__Quantum__Intrinsic__H__ctl(%Array* %__controlQubits__, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  call void @__quantum__qis__h__ctl(%Array* %__controlQubits__, %Qubit* %qubit)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  ret void
}

declare void @__quantum__qis__h__ctl(%Array*, %Qubit*)

define internal void @Microsoft__Quantum__Intrinsic__H__ctladj(%Array* %__controlQubits__, %Qubit* %qubit) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 1)
  call void @__quantum__qis__h__ctl(%Array* %__controlQubits__, %Qubit* %qubit)
  call void @__quantum__rt__array_update_alias_count(%Array* %__controlQubits__, i32 -1)
  ret void
}

declare %Result* @__quantum__qis__measure__body(%Array*, %Array*)

define internal %Result* @Microsoft__Quantum__Intrinsic__Measure__body(%Array* %bases, %Array* %qubits) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %bases, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %qubits, i32 1)
  %0 = call %Result* @__quantum__qis__measure__body(%Array* %bases, %Array* %qubits)
  call void @__quantum__rt__array_update_alias_count(%Array* %bases, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %qubits, i32 -1)
  ret %Result* %0
}

define internal void @Microsoft__Quantum__Diagnostics__Fact__body(i1 %actual, %String* %message) {
entry:
  %0 = xor i1 %actual, true
  br i1 %0, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  call void @__quantum__rt__string_update_reference_count(%String* %message, i32 1)
  call void @__quantum__rt__fail(%String* %message)
  unreachable

continue__1:                                      ; preds = %entry
  ret void
}

declare void @__quantum__rt__fail(%String*)

define internal i64 @Microsoft__Quantum__Math____QsRef2__AccumulatedBitsizeI____body(i64 %val, i64 %bitsize) {
entry:
  %0 = icmp eq i64 %val, 0
  br i1 %0, label %condTrue__1, label %condFalse__1

condTrue__1:                                      ; preds = %entry
  br label %condContinue__1

condFalse__1:                                     ; preds = %entry
  %1 = sdiv i64 %val, 2
  %2 = add i64 %bitsize, 1
  %3 = call i64 @Microsoft__Quantum__Math____QsRef2__AccumulatedBitsizeI____body(i64 %1, i64 %2)
  br label %condContinue__1

condContinue__1:                                  ; preds = %condFalse__1, %condTrue__1
  %4 = phi i64 [ %bitsize, %condTrue__1 ], [ %3, %condFalse__1 ]
  ret i64 %4
}

define internal i64 @Microsoft__Quantum__Convert__BoolArrayAsInt__body(%Array* %bits) {
entry:
  %number = alloca i64, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %bits, i32 1)
  %nBits = call i64 @__quantum__rt__array_get_size_1d(%Array* %bits)
  %0 = icmp slt i64 %nBits, 64
  %1 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @3, i32 0, i32 0))
  %2 = call %String* @__quantum__rt__int_to_string(i64 %nBits)
  %3 = call %String* @__quantum__rt__string_concatenate(%String* %1, %String* %2)
  call void @__quantum__rt__string_update_reference_count(%String* %1, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %2, i32 -1)
  %4 = call %String* @__quantum__rt__string_create(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @4, i32 0, i32 0))
  %5 = call %String* @__quantum__rt__string_concatenate(%String* %3, %String* %4)
  call void @__quantum__rt__string_update_reference_count(%String* %3, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %4, i32 -1)
  call void @Microsoft__Quantum__Diagnostics__Fact__body(i1 %0, %String* %5)
  store i64 0, i64* %number, align 4
  %6 = sub i64 %nBits, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %entry
  %idxBit = phi i64 [ 0, %entry ], [ %16, %exiting__1 ]
  %7 = icmp sle i64 %idxBit, %6
  br i1 %7, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %8 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %bits, i64 %idxBit)
  %9 = bitcast i8* %8 to i1*
  %10 = load i1, i1* %9, align 1
  br i1 %10, label %then0__1, label %continue__1

then0__1:                                         ; preds = %body__1
  %11 = load i64, i64* %number, align 4
  %12 = trunc i64 %idxBit to i32
  %13 = call double @llvm.powi.f64.i32(double 2.000000e+00, i32 %12)
  %14 = fptosi double %13 to i64
  %15 = add i64 %11, %14
  store i64 %15, i64* %number, align 4
  br label %continue__1

continue__1:                                      ; preds = %then0__1, %body__1
  br label %exiting__1

exiting__1:                                       ; preds = %continue__1
  %16 = add i64 %idxBit, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  %17 = load i64, i64* %number, align 4
  call void @__quantum__rt__array_update_alias_count(%Array* %bits, i32 -1)
  call void @__quantum__rt__string_update_reference_count(%String* %5, i32 -1)
  ret i64 %17
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.powi.f64.i32(double, i32) #0

define internal %Array* @Microsoft__Quantum__Convert__ResultArrayAsBoolArray__body(%Array* %input) {
entry:
  call void @__quantum__rt__array_update_alias_count(%Array* %input, i32 1)
  %0 = call %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]* @Microsoft__Quantum__Convert__ResultAsBool__FunctionTable, [2 x void (%Tuple*, i32)*]* null, %Tuple* null)
  %1 = call %Array* @Microsoft__Quantum__Arrays___2fded0c1ea88482f9cee9d009f5bb221_Mapped__body(%Callable* %0, %Array* %input)
  call void @__quantum__rt__array_update_alias_count(%Array* %input, i32 -1)
  call void @__quantum__rt__capture_update_reference_count(%Callable* %0, i32 -1)
  call void @__quantum__rt__callable_update_reference_count(%Callable* %0, i32 -1)
  ret %Array* %1
}

define internal %Array* @Microsoft__Quantum__Arrays___2fded0c1ea88482f9cee9d009f5bb221_Mapped__body(%Callable* %mapper, %Array* %array) {
entry:
  %retval = alloca %Array*, align 8
  call void @__quantum__rt__capture_update_alias_count(%Callable* %mapper, i32 1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %mapper, i32 1)
  call void @__quantum__rt__array_update_alias_count(%Array* %array, i32 1)
  %length = call i64 @__quantum__rt__array_get_size_1d(%Array* %array)
  %0 = icmp eq i64 %length, 0
  br i1 %0, label %then0__1, label %continue__1

then0__1:                                         ; preds = %entry
  %1 = call %Array* @__quantum__rt__array_create_1d(i32 1, i64 0)
  call void @__quantum__rt__capture_update_alias_count(%Callable* %mapper, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %mapper, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %array, i32 -1)
  ret %Array* %1

continue__1:                                      ; preds = %entry
  %2 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %array, i64 0)
  %3 = bitcast i8* %2 to %Result**
  %4 = load %Result*, %Result** %3, align 8
  %5 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Result* }* getelementptr ({ %Result* }, { %Result* }* null, i32 1) to i64))
  %6 = bitcast %Tuple* %5 to { %Result* }*
  %7 = getelementptr inbounds { %Result* }, { %Result* }* %6, i32 0, i32 0
  store %Result* %4, %Result** %7, align 8
  %8 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i1 }* getelementptr ({ i1 }, { i1 }* null, i32 1) to i64))
  call void @__quantum__rt__callable_invoke(%Callable* %mapper, %Tuple* %5, %Tuple* %8)
  %9 = bitcast %Tuple* %8 to { i1 }*
  %10 = getelementptr inbounds { i1 }, { i1 }* %9, i32 0, i32 0
  %first = load i1, i1* %10, align 1
  %11 = call %Array* @__quantum__rt__array_create_1d(i32 1, i64 %length)
  %12 = sub i64 %length, 1
  br label %header__1

header__1:                                        ; preds = %exiting__1, %continue__1
  %13 = phi i64 [ 0, %continue__1 ], [ %17, %exiting__1 ]
  %14 = icmp sle i64 %13, %12
  br i1 %14, label %body__1, label %exit__1

body__1:                                          ; preds = %header__1
  %15 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %11, i64 %13)
  %16 = bitcast i8* %15 to i1*
  store i1 %first, i1* %16, align 1
  br label %exiting__1

exiting__1:                                       ; preds = %body__1
  %17 = add i64 %13, 1
  br label %header__1

exit__1:                                          ; preds = %header__1
  store %Array* %11, %Array** %retval, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %11, i32 1)
  %18 = sub i64 %length, 1
  br label %header__2

header__2:                                        ; preds = %exiting__2, %exit__1
  %idx = phi i64 [ 1, %exit__1 ], [ %35, %exiting__2 ]
  %19 = icmp sle i64 %idx, %18
  br i1 %19, label %body__2, label %exit__2

body__2:                                          ; preds = %header__2
  %20 = load %Array*, %Array** %retval, align 8
  call void @__quantum__rt__array_update_alias_count(%Array* %20, i32 -1)
  %21 = call %Array* @__quantum__rt__array_copy(%Array* %20, i1 false)
  %22 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %array, i64 %idx)
  %23 = bitcast i8* %22 to %Result**
  %24 = load %Result*, %Result** %23, align 8
  %25 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ %Result* }* getelementptr ({ %Result* }, { %Result* }* null, i32 1) to i64))
  %26 = bitcast %Tuple* %25 to { %Result* }*
  %27 = getelementptr inbounds { %Result* }, { %Result* }* %26, i32 0, i32 0
  store %Result* %24, %Result** %27, align 8
  %28 = call %Tuple* @__quantum__rt__tuple_create(i64 ptrtoint ({ i1 }* getelementptr ({ i1 }, { i1 }* null, i32 1) to i64))
  call void @__quantum__rt__callable_invoke(%Callable* %mapper, %Tuple* %25, %Tuple* %28)
  %29 = bitcast %Tuple* %28 to { i1 }*
  %30 = getelementptr inbounds { i1 }, { i1 }* %29, i32 0, i32 0
  %31 = load i1, i1* %30, align 1
  %32 = call i8* @__quantum__rt__array_get_element_ptr_1d(%Array* %21, i64 %idx)
  %33 = bitcast i8* %32 to i1*
  %34 = load i1, i1* %33, align 1
  store i1 %31, i1* %33, align 1
  call void @__quantum__rt__array_update_alias_count(%Array* %21, i32 1)
  store %Array* %21, %Array** %retval, align 8
  call void @__quantum__rt__array_update_reference_count(%Array* %20, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %25, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %28, i32 -1)
  br label %exiting__2

exiting__2:                                       ; preds = %body__2
  %35 = add i64 %idx, 1
  br label %header__2

exit__2:                                          ; preds = %header__2
  %36 = load %Array*, %Array** %retval, align 8
  call void @__quantum__rt__capture_update_alias_count(%Callable* %mapper, i32 -1)
  call void @__quantum__rt__callable_update_alias_count(%Callable* %mapper, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %array, i32 -1)
  call void @__quantum__rt__array_update_alias_count(%Array* %36, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %5, i32 -1)
  call void @__quantum__rt__tuple_update_reference_count(%Tuple* %8, i32 -1)
  ret %Array* %36
}

define internal void @Microsoft__Quantum__Convert__ResultAsBool__body__wrapper(%Tuple* %capture-tuple, %Tuple* %arg-tuple, %Tuple* %result-tuple) {
entry:
  %0 = bitcast %Tuple* %arg-tuple to { %Result* }*
  %1 = getelementptr inbounds { %Result* }, { %Result* }* %0, i32 0, i32 0
  %2 = load %Result*, %Result** %1, align 8
  %3 = call i1 @Microsoft__Quantum__Convert__ResultAsBool__body(%Result* %2)
  %4 = bitcast %Tuple* %result-tuple to { i1 }*
  %5 = getelementptr inbounds { i1 }, { i1 }* %4, i32 0, i32 0
  store i1 %3, i1* %5, align 1
  ret void
}

declare %Callable* @__quantum__rt__callable_create([4 x void (%Tuple*, %Tuple*, %Tuple*)*]*, [2 x void (%Tuple*, i32)*]*, %Tuple*)

declare void @__quantum__rt__capture_update_reference_count(%Callable*, i32)

declare void @__quantum__rt__callable_update_reference_count(%Callable*, i32)

define internal i1 @Microsoft__Quantum__Convert__ResultAsBool__body(%Result* %input) {
entry:
  %0 = call %Result* @__quantum__rt__result_get_zero()
  %1 = call i1 @__quantum__rt__result_equal(%Result* %input, %Result* %0)
  %2 = select i1 %1, i1 false, i1 true
  ret i1 %2
}

declare %Result* @__quantum__rt__result_get_zero()

declare i1 @__quantum__rt__result_equal(%Result*, %Result*)

declare void @__quantum__rt__capture_update_alias_count(%Callable*, i32)

declare void @__quantum__rt__callable_update_alias_count(%Callable*, i32)

declare void @__quantum__rt__callable_invoke(%Callable*, %Tuple*, %Tuple*)

declare %Tuple* @__quantum__rt__tuple_create(i64)

declare %Array* @__quantum__rt__array_copy(%Array*, i1)

declare void @__quantum__rt__tuple_update_reference_count(%Tuple*, i32)

define i64 @QuantumRNGComplex__SampleRandomNumber__Interop() #1 {
entry:
  %0 = call i64 @QuantumRNGComplex__SampleRandomNumber__body()
  ret i64 %0
}

define void @QuantumRNGComplex__SampleRandomNumber() #2 {
entry:
  %0 = call i64 @QuantumRNGComplex__SampleRandomNumber__body()
  %1 = call %String* @__quantum__rt__int_to_string(i64 %0)
  call void @__quantum__rt__message(%String* %1)
  call void @__quantum__rt__string_update_reference_count(%String* %1, i32 -1)
  ret void
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #1 = { "InteropFriendly" }
attributes #2 = { "EntryPoint" }
