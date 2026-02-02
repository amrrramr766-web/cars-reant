class CheckoutArgs {
  final String image;
  final String name;
  final String date;
  final String price;
  final String? transactionId;

  CheckoutArgs({
    required this.image,
    required this.name,
    required this.date,
    required this.price,
    this.transactionId,
  });
}
