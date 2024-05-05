// product stream update

import 'package:flutter_bloc/flutter_bloc.dart';

import 'PageEvent.dart';
import 'PageState.dart';

class AddProductBlo extends Bloc<ProductEvent,AddProductState>{
  AddProductBlo(): super(InitStateOfAddProduct()){
    on<UpdateProductEvent>((event, emit) => emit(UpdateProductState()));
    on<InitialEventOfProduct>((event, emit) => emit(InitStateOfAddProduct()));

    // product stream update


  }
}




class AddServiceBlo extends Bloc<ServicesEvent,AddServiceState>{
  AddServiceBlo(): super(InitStateOfAddService()){
    on<UpdateServicesEvent>((event, emit) => emit(UpdateServiceState()));
    on<InitialEventOfServices>((event, emit) => emit(InitStateOfAddService()));

    // product stream update


  }
}
// adding timer

class AddTimerBlo extends Bloc<TimerEvent,AddTimerState>{
  AddTimerBlo(): super(InitStateOfAddTimer()){
    on<UpdateTimerEvent>((event, emit) => emit(UpdateTimerState()));
    on<InitialEventOfTimer>((event, emit) => emit(InitStateOfAddTimer()));

    // Timer stream update


  }
}

class QuotesBlo extends Bloc<QuotesEvent,QuotesState>{
  QuotesBlo(): super(InitStateOfQuotes()){
    on<UpdateQuotesEvent>((event, emit) => emit(UpdateQuotesState()));
    on<InitialEventOfQuotes>((event, emit) => emit(InitStateOfQuotes()));

    // quotes stream update

  }
}

class AddOnBlo extends Bloc<AddOnEvent,AddOnState> {
  AddOnBlo() : super(InitStateOfAddOn()) {
    on<UpdateAddOnEvent>((event, emit) => emit(UpdateAddOnState()));
    on<InitialEventOfAddOn>((event, emit) => emit(InitStateOfAddOn()));

    // AddOn stream update


  }
}

class GraphBlo extends Bloc<GraphEvent,GraphState> {
  GraphBlo() : super(InitStateOfGraph()) {
    on<UpdateGraphEvent>((event, emit) => emit(UpdateGraphState()));
    on<InitialEventOfGraph>((event, emit) => emit(InitStateOfGraph()));

    // graph stream update


  }
}


// order bloc
class ProductOrderBlo extends Bloc<ProductOrderEvent,ProductOrderState> {
  ProductOrderBlo() : super(InitStateOfProductOrder()) {
    on<UpdateProductOrderEvent>((event, emit) => emit(UpdateProductOrderState()));
    on<InitialEventOfProductOrder>((event, emit) => emit(InitStateOfProductOrder()));

    // order stream update


  }
}


// service order
class ServiceOrderBlo extends Bloc<ServiceOrderEvent,ServiceOrderState> {
  ServiceOrderBlo() : super(InitStateOfServiceOrder()) {
    on<UpdateServiceOrderEvent>((event, emit) => emit(UpdateServiceOrderState()));
    on<InitialEventOfServiceOrder>((event, emit) => emit(InitStateOfServiceOrder()));

    // service order stream update


  }
}