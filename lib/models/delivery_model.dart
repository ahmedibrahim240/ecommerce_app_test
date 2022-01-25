class Deliverymodels {
  final int? value;
  final String? title, subTitle;

  Deliverymodels({
    this.value,
    this.title,
    this.subTitle,
  });
}

List<Deliverymodels> deliveryRidoList = [
  Deliverymodels(
    title: 'Standard Delivery',
    subTitle: 'Order will be delivered between 3 - 5 business days',
    value: 1,
  ),
  Deliverymodels(
    title: 'Next Day Delivery',
    subTitle:
        'Place your order before 6pm and your items will be delivered the next day',
    value: 2,
  ),
  Deliverymodels(
    title: 'Nominated Delivery',
    subTitle:
        'Pick a particular date from the calendar and order will be delivered on selected date',
    value: 3,
  ),
];
