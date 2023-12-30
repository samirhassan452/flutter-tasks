part of '../../shared_feature.exports.dart';

abstract class InvestmentCalculator {
  double calculateCapitalAtMaturity(double amount);
  double calculateTotalInterest(double amount);
  double calculateAnnualInterest(double amount);
  int calculateAverageMaturityDate();
}

abstract class ExponentiableCalculator {
  double increment(double amount);
  double decrement(double amount);
  double exponentialIncrement(double amount);
  double exponentialDecrement(double amount);
}

class Calculator implements InvestmentCalculator, ExponentiableCalculator {
  final double annualYield;
  final int term;

  Calculator({
    required this.annualYield,
    required this.term,
  });

  factory Calculator.initial() => Calculator(
        annualYield: AppConfig.annualYield,
        term: AppConfig.initialYearTerm,
      );

  @override
  double calculateCapitalAtMaturity(double amount) {
    return (annualYield / 100 * term * amount) + amount;
  }

  @override
  double calculateTotalInterest(double amount) {
    return (annualYield / 100 * term * amount);
  }

  @override
  double calculateAnnualInterest(double amount) {
    return amount * (annualYield / 100);
  }

  @override
  int calculateAverageMaturityDate() {
    DateTime currentDate = DateTime.now();
    // Assuming 365 days in a year
    // DateTime maturityDate = currentDate.add(Duration(days: term * 365));
    // return maturityDate.year;
    return currentDate.year + term;
  }

  @override
  double increment(double amount) {
    if (amount >= AppConfig.initialAmount) {
      return (amount + AppConfig.initialAmount);
    } else {
      return amount <= AppConfig.threshold
          ? AppConfig.minimumAmount
          : (amount + AppConfig.minimumAmount);
    }
  }

  @override
  double decrement(double amount) {
    if (amount <= AppConfig.initialAmount) {
      return (amount - AppConfig.minimumAmount)
          .clamp(AppConfig.threshold, AppConfig.initialAmount);
    } else {
      return (amount - AppConfig.initialAmount);
    }
  }

  @override
  double exponentialIncrement(double amount) {
    /* *exponential growth*
    f(x)=a(1+r)^x
    a: is the initial amount
    r: is the rate of growth
    x: is the time
    */
    return amount * pow(1 + (annualYield / 100), term);
  }

  @override
  double exponentialDecrement(double amount) {
    /* *exponential decay*
    f(x)=a(1-r)^x
    a: is the initial amount
    r: is the rate of growth
    x: is the time
    */
    return (amount * pow(1 - (annualYield / 100), term))
        .clamp(AppConfig.threshold, AppConfig.initialAmount);
  }

  Calculator copyWith({
    double? annualYield,
    int? term,
  }) {
    return Calculator(
      annualYield: annualYield ?? this.annualYield,
      term: term ?? this.term,
    );
  }
}
