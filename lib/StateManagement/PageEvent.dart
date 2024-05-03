//  Product Event events

abstract class ProductEvent{}

class UpdateProductEvent extends ProductEvent{}

class InitialEventOfProduct extends ProductEvent{}


//add servicess

abstract class ServicesEvent{}

class UpdateServicesEvent extends ServicesEvent{}

class InitialEventOfServices extends ServicesEvent{}

// adding timer
abstract class TimerEvent{}

class UpdateTimerEvent extends TimerEvent{}

class InitialEventOfTimer extends TimerEvent{}

//adding quotes
abstract class QuotesEvent{}

class UpdateQuotesEvent extends QuotesEvent{}

class InitialEventOfQuotes extends QuotesEvent{}

//adding addon services
abstract class AddOnEvent{}

class UpdateAddOnEvent extends AddOnEvent{}

class InitialEventOfAddOn extends AddOnEvent{}

// graph
abstract class GraphEvent{}

class UpdateGraphEvent extends GraphEvent{}

class InitialEventOfGraph extends GraphEvent{}
// orders
abstract class ProductOrderEvent{}

class UpdateProductOrderEvent extends ProductOrderEvent{}

class InitialEventOfProductOrder extends ProductOrderEvent{}


// service order
abstract class ServiceOrderEvent{}

class UpdateServiceOrderEvent extends ServiceOrderEvent{}

class InitialEventOfServiceOrder extends ServiceOrderEvent{}