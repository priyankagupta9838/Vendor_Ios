// Add to product State


abstract class AddProductState{}

class InitStateOfAddProduct extends AddProductState{}

class UpdateProductState extends AddProductState{}
//  add services

abstract class AddServiceState{}

class InitStateOfAddService extends AddServiceState{}

class UpdateServiceState extends AddServiceState{}

// adding timer
abstract class AddTimerState{}

class InitStateOfAddTimer extends AddTimerState{}

class UpdateTimerState extends AddTimerState{}
// adding quotes
abstract class QuotesState{}

class InitStateOfQuotes extends QuotesState{}

class UpdateQuotesState extends QuotesState{}


//adding addon services
abstract class AddOnState{}

class InitStateOfAddOn extends AddOnState{}

class UpdateAddOnState extends AddOnState{}

//graph
abstract class GraphState{}

class InitStateOfGraph extends GraphState{}

class UpdateGraphState extends GraphState{}
// orders
abstract class ProductOrderState{}

class InitStateOfProductOrder extends ProductOrderState{}

class UpdateProductOrderState extends ProductOrderState{}
// service order
abstract class ServiceOrderState{}

class InitStateOfServiceOrder extends ServiceOrderState{}

class UpdateServiceOrderState extends ServiceOrderState{}