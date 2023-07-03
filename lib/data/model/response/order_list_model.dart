// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderPage orderPageFromJson(String str) => OrderPage.fromJson(json.decode(str));

String orderListModelToJson(OrderPage data) => json.encode(data.toJson());

class OrderPage {
  List<OrderModel>? data;
  Paginator? paginator;

  OrderPage({
    this.data,
    this.paginator,
  });

  factory OrderPage.fromJson(Map<String, dynamic> json) => OrderPage(
    data: json["data"] == null ? [] : List<OrderModel>.from(json["data"]!.map((x) => OrderModel.fromJson(x))),
    paginator: json["paginator"] == null ? null : Paginator.fromJson(json["paginator"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "paginator": paginator?.toJson(),
  };
}

class OrderModel {
  String? id;
  String? productId;
  String? customerId;
  int? quantity;
  String? style;
  String? fabric;
  int? gsm;
  DateTime? orderDate;
  DateTime? deliveryDate;
  OrderStatusEnum? paymentStatus;
  OrderStatusEnum? orderStatus;
  int? amount;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  Product? product;
  List<DatumTask>? tasks;
  List<Size>? orderSizes;
  Customer? customer;

  OrderModel({
    this.id,
    this.productId,
    this.customerId,
    this.quantity,
    this.style,
    this.fabric,
    this.gsm,
    this.orderDate,
    this.deliveryDate,
    this.paymentStatus,
    this.orderStatus,
    this.amount,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.product,
    this.tasks,
    this.orderSizes,
    this.customer,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["_id"],
    productId: json["product_id"],
    customerId: json["customer_id"],
    quantity: json["quantity"],
    style: json["style"],
    fabric: json["fabric"],
    gsm: json["GSM"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    deliveryDate: json["delivery_date"] == null ? null : DateTime.parse(json["delivery_date"]),
    paymentStatus: orderStatusEnumValues.map[json["payment_status"]]!,
    orderStatus: orderStatusEnumValues.map[json["order_status"]]!,
    amount: json["amount"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    tasks: json["tasks"] == null ? [] : List<DatumTask>.from(json["tasks"]!.map((x) => DatumTask.fromJson(x))),
    orderSizes: json["order_sizes"] == null ? [] : List<Size>.from(json["order_sizes"]!.map((x) => Size.fromJson(x))),
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "product_id": productId,
    "customer_id": customerId,
    "quantity": quantity,
    "style": style,
    "fabric": fabric,
    "GSM": gsm,
    "order_date": orderDate?.toIso8601String(),
    "delivery_date": deliveryDate?.toIso8601String(),
    "payment_status": orderStatusEnumValues.reverse[paymentStatus],
    "order_status": orderStatusEnumValues.reverse[orderStatus],
    "amount": amount,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "product": product?.toJson(),
    "tasks": tasks == null ? [] : List<dynamic>.from(tasks!.map((x) => x.toJson())),
    "order_sizes": orderSizes == null ? [] : List<dynamic>.from(orderSizes!.map((x) => x.toJson())),
    "customer": customer?.toJson(),
  };
}

class Customer {
  String? id;
  String? name;
  String? mobile;
  String? email;
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? companyName;
  Address? address;
  List<Designation>? designation;
  String? alternativeMobile;
  String? password;

  Customer({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.companyName,
    this.address,
    this.designation,
    this.alternativeMobile,
    this.password,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["_id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    status: statusValues.map[json["status"]]!,
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    companyName: json["company_name"],
    address: json["address"]==null?null:addressValues.map[json["address"]],
    designation: json["designation"] == null ? [] : List<Designation>.from(json["designation"]!.map((x) => designationValues.map[x]!)),
    alternativeMobile: json["alternative_mobile"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "status": statusValues.reverse[status],
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "company_name": companyName,
    "address": addressValues.reverse[address],
    "designation": designation == null ? [] : List<dynamic>.from(designation!.map((x) => designationValues.reverse[x])),
    "alternative_mobile": alternativeMobile,
    "password": password,
  };
}

enum Address { INDORE, ADDRESS_INDORE, SHREE_NAGAR_EXTENSION_INDORE }

final addressValues = EnumValues({
  "Indore": Address.ADDRESS_INDORE,
  "indore": Address.INDORE,
  "Shree nagar extension indore": Address.SHREE_NAGAR_EXTENSION_INDORE
});

enum Designation { CUTTER, STITCHER, EMBROIDER, FINISHER, PACKAGER }

final designationValues = EnumValues({
  "cutter": Designation.CUTTER,
  "embroider": Designation.EMBROIDER,
  "finisher": Designation.FINISHER,
  "packager": Designation.PACKAGER,
  "stitcher": Designation.STITCHER
});

enum Status { ACTIVE }

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

class Size {
  String? id;
  String? orderId;
  String? size;
  int? quantity;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? taskId;
  int? lapse;

  Size({
    this.id,
    this.orderId,
    this.size,
    this.quantity,
    this.v,
    this.createdAt,
    this.updatedAt,
    this.taskId,
    this.lapse,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
    id: json["_id"],
    orderId: json["order_id"],
    size: json["size"],
    quantity: json["quantity"],
    v: json["__v"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    taskId: json["task_id"],
    lapse: json["lapse"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "order_id": orderId,
    "size": size,
    "quantity": quantity,
    "__v": v,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "task_id": taskId,
    "lapse": lapse,
  };
}

enum OrderStatusEnum { PENDING, COMPLETED }

final orderStatusEnumValues = EnumValues({
  "completed": OrderStatusEnum.COMPLETED,
  "pending": OrderStatusEnum.PENDING
});

class Product {
  String? id;
  String? name;
  List<ProductTask>? tasks;
  List<String>? productImage;
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Product({
    this.id,
    this.name,
    this.tasks,
    this.productImage,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    name: json["name"],
    tasks: json["tasks"] == null ? [] : List<ProductTask>.from(json["tasks"]!.map((x) => ProductTask.fromJson(x))),
    productImage: json["product_image"] == null ? [] : List<String>.from(json["product_image"]!.map((x) => x)),
    status: statusValues.map[json["status"]]!,
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "tasks": tasks == null ? [] : List<dynamic>.from(tasks!.map((x) => x.toJson())),
    "product_image": productImage == null ? [] : List<dynamic>.from(productImage!.map((x) => x)),
    "status": statusValues.reverse[status],
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class ProductTask {
  String? task;
  int? cost;
  String? id;

  ProductTask({
    this.task,
    this.cost,
    this.id,
  });

  factory ProductTask.fromJson(Map<String, dynamic> json) => ProductTask(
    task: json["task"],
    cost: json["cost"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "task": task,
    "cost": cost,
    "_id": id,
  };
}

class DatumTask {
  String? id;
  EmployeeId? employeeId;
  String? orderId;
  String? task;
  OrderStatusEnum? taskStatus;
  String? note;
  OrderStatusEnum? paymentStatus;
  int? cost;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;
  Customer? employee;
  List<Size>? taskSizes;

  DatumTask({
    this.id,
    this.employeeId,
    this.orderId,
    this.task,
    this.taskStatus,
    this.note,
    this.paymentStatus,
    this.cost,
    this.v,
    this.createdAt,
    this.updatedAt,
    this.employee,
    this.taskSizes,
  });

  factory DatumTask.fromJson(Map<String, dynamic> json) => DatumTask(
    id: json["_id"],
    employeeId: employeeIdValues.map[json["employee_id"]]!,
    orderId: json["order_id"],
    task: json["task"],
    taskStatus: orderStatusEnumValues.map[json["task_status"]]!,
    note: json["note"],
    paymentStatus: orderStatusEnumValues.map[json["payment_status"]]!,
    cost: json["cost"],
    v: json["__v"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    employee: json["employee"] == null ? null : Customer.fromJson(json["employee"]),
    taskSizes: json["task_sizes"] == null ? [] : List<Size>.from(json["task_sizes"]!.map((x) => Size.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "employee_id": employeeIdValues.reverse[employeeId],
    "order_id": orderId,
    "task": task,
    "task_status": orderStatusEnumValues.reverse[taskStatus],
    "note": note,
    "payment_status": orderStatusEnumValues.reverse[paymentStatus],
    "cost": cost,
    "__v": v,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "employee": employee?.toJson(),
    "task_sizes": taskSizes == null ? [] : List<dynamic>.from(taskSizes!.map((x) => x.toJson())),
  };
}

enum EmployeeId { THE_6486_AA206_C89_C00_A8_A43_CB7_D, THE_6489_C7_ED0_B853_A7_A72_D92_DFE }

final employeeIdValues = EnumValues({
  "6486aa206c89c00a8a43cb7d": EmployeeId.THE_6486_AA206_C89_C00_A8_A43_CB7_D,
  "6489c7ed0b853a7a72d92dfe": EmployeeId.THE_6489_C7_ED0_B853_A7_A72_D92_DFE
});

class Paginator {
  int? totalDocs;
  int? limit;
  int? page;
  int? totalPages;
  int? slNo;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  Paginator({
    this.totalDocs,
    this.limit,
    this.page,
    this.totalPages,
    this.slNo,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory Paginator.fromJson(Map<String, dynamic> json) => Paginator(
    totalDocs: json["totalDocs"],
    limit: json["limit"],
    page: json["page"],
    totalPages: json["totalPages"],
    slNo: json["slNo"],
    hasPrevPage: json["hasPrevPage"],
    hasNextPage: json["hasNextPage"],
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalDocs": totalDocs,
    "limit": limit,
    "page": page,
    "totalPages": totalPages,
    "slNo": slNo,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
