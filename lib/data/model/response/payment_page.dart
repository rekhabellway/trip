import 'dart:convert';

PaymentPage paymentPageFromJson(String str) => PaymentPage.fromJson(json.decode(str));

String paymentPageToJson(PaymentPage data) => json.encode(data.toJson());

class PaymentPage {
  List<PaymentModel>? data;
  Paginator? paginator;

  PaymentPage({
    this.data,
    this.paginator,
  });

  factory PaymentPage.fromJson(Map<String, dynamic> json) => PaymentPage(
    data: json["data"] == null ? [] : List<PaymentModel>.from(json["data"]!.map((x) => PaymentModel.fromJson(x))),
    paginator: json["paginator"] == null ? null : Paginator.fromJson(json["paginator"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "paginator": paginator?.toJson(),
  };
}

class PaymentModel {
  String? id;
  String? taskId;
  String? employeeId;
  String? note;
  String? type;
  int? amount;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  Task? task;
  Employee? employee;

  PaymentModel({
    this.id,
    this.taskId,
    this.employeeId,
    this.note,
    this.type,
    this.amount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.task,
    this.employee,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    id: json["_id"],
    taskId: json["task_id"],
    employeeId: json["employee_id"],
    note: json["note"],
    type: json["type"],
    amount: json["amount"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    task: json["task"] == null ? null : Task.fromJson(json["task"]),
    employee: json["employee"] == null ? null : Employee.fromJson(json["employee"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "task_id": taskId,
    "employee_id": employeeId,
    "note": note,
    "type": type,
    "amount": amount,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "task": task?.toJson(),
    "employee": employee?.toJson(),
  };
}

class Employee {
  String? id;
  String? name;
  List<Designation>? designation;
  String? address;
  String? mobile;
  String? alternativeMobile;
  String? email;
  String? password;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Employee({
    this.id,
    this.name,
    this.designation,
    this.address,
    this.mobile,
    this.alternativeMobile,
    this.email,
    this.password,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["_id"],
    name: json["name"],
    designation: json["designation"] == null ? [] : List<Designation>.from(json["designation"]!.map((x) => designationValues.map[x]!)),
    address: json["address"],
    mobile: json["mobile"],
    alternativeMobile: json["alternative_mobile"],
    email: json["email"],
    password: json["password"],
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "designation": designation == null ? [] : List<dynamic>.from(designation!.map((x) => designationValues.reverse[x])),
    "address": address,
    "mobile": mobile,
    "alternative_mobile": alternativeMobile,
    "email": email,
    "password": password,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

enum Designation { CUTTER, STITCHER, EMBROIDER, FINISHER, PACKAGER }

final designationValues = EnumValues({
  "cutter": Designation.CUTTER,
  "embroider": Designation.EMBROIDER,
  "finisher": Designation.FINISHER,
  "packager": Designation.PACKAGER,
  "stitcher": Designation.STITCHER
});

class Task {
  String? id;
  String? employeeId;
  String? orderId;
  String? task;
  String? taskStatus;
  String? note;
  String? paymentStatus;
  int? cost;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;

  Task({
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
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["_id"],
    employeeId: json["employee_id"],
    orderId: json["order_id"],
    task: json["task"],
    taskStatus: json["task_status"],
    note: json["note"],
    paymentStatus: json["payment_status"],
    cost: json["cost"],
    v: json["__v"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "employee_id": employeeId,
    "order_id": orderId,
    "task": task,
    "task_status": taskStatus,
    "note": note,
    "payment_status": paymentStatus,
    "cost": cost,
    "__v": v,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

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
