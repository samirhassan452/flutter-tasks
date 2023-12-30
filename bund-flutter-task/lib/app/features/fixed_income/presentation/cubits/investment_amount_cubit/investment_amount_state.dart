part of '../../../fixed_income.exports.dart';

class InvestmentAmountState extends Equatable {
  final Calculator calculator;
  final double amount;

  // final bool isLoading;
  final BlocStatus status;
  final BlocStatus amountStatus;
  final BlocStatus yearTermStatus;
  const InvestmentAmountState({
    required this.calculator,
    required this.amount,
    // this.isLoading = false,
    this.status = BlocStatus.initial,
    this.amountStatus = BlocStatus.initial,
    this.yearTermStatus = BlocStatus.initial,
  });

  @override
  List<Object> get props => [
        calculator,
        amount,
        // isLoading,
        status,
        amountStatus,
        yearTermStatus,
      ];

  int get yearTerm => calculator.term;
  // double.parse(percentage.toStringAsFixed(2))
  double get capitalAtMaturity =>
      calculator.calculateCapitalAtMaturity(amount).toPrecision();
  double get totalInterest =>
      calculator.calculateTotalInterest(amount).toPrecision();
  double get annualInterest =>
      calculator.calculateAnnualInterest(amount).toPrecision();
  String get averageMaturityDate =>
      calculator.calculateAverageMaturityDate().toString();

  bool get rebuildCalculator =>
      status.isLoading || status.isSuccess || status.isFailure;
  bool get rebuildAmount =>
      amountStatus.isLoading ||
      amountStatus.isSuccess ||
      amountStatus.isFailure;
  bool get rebuildYearTerm =>
      yearTermStatus.isLoading ||
      yearTermStatus.isSuccess ||
      yearTermStatus.isFailure;

  InvestmentAmountState copyWith({
    Calculator? calculator,
    double? amount,
    // bool? isLoading,
    BlocStatus? status,
    BlocStatus? amountStatus,
    BlocStatus? yearTermStatus,
  }) {
    return InvestmentAmountState(
      calculator: calculator ?? this.calculator,
      amount: amount ?? this.amount,
      // isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      amountStatus: amountStatus ?? this.amountStatus,
      yearTermStatus: yearTermStatus ?? this.yearTermStatus,
    );
  }
}
