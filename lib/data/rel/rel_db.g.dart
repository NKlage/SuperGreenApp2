// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rel_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Device extends DataClass implements Insertable<Device> {
  final int id;
  final String identifier;
  final String name;
  final String ip;
  final String mdns;
  final bool isReachable;
  final bool isSetup;
  final String serverID;
  final bool synced;
  Device(
      {@required this.id,
      @required this.identifier,
      @required this.name,
      @required this.ip,
      @required this.mdns,
      @required this.isReachable,
      @required this.isSetup,
      this.serverID,
      @required this.synced});
  factory Device.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Device(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      identifier: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}identifier']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      ip: stringType.mapFromDatabaseResponse(data['${effectivePrefix}ip']),
      mdns: stringType.mapFromDatabaseResponse(data['${effectivePrefix}mdns']),
      isReachable: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_reachable']),
      isSetup:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_setup']),
      serverID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}server_i_d']),
      synced:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}synced']),
    );
  }
  factory Device.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Device(
      id: serializer.fromJson<int>(json['id']),
      identifier: serializer.fromJson<String>(json['identifier']),
      name: serializer.fromJson<String>(json['name']),
      ip: serializer.fromJson<String>(json['ip']),
      mdns: serializer.fromJson<String>(json['mdns']),
      isReachable: serializer.fromJson<bool>(json['isReachable']),
      isSetup: serializer.fromJson<bool>(json['isSetup']),
      serverID: serializer.fromJson<String>(json['serverID']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'identifier': serializer.toJson<String>(identifier),
      'name': serializer.toJson<String>(name),
      'ip': serializer.toJson<String>(ip),
      'mdns': serializer.toJson<String>(mdns),
      'isReachable': serializer.toJson<bool>(isReachable),
      'isSetup': serializer.toJson<bool>(isSetup),
      'serverID': serializer.toJson<String>(serverID),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  @override
  DevicesCompanion createCompanion(bool nullToAbsent) {
    return DevicesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      identifier: identifier == null && nullToAbsent
          ? const Value.absent()
          : Value(identifier),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      ip: ip == null && nullToAbsent ? const Value.absent() : Value(ip),
      mdns: mdns == null && nullToAbsent ? const Value.absent() : Value(mdns),
      isReachable: isReachable == null && nullToAbsent
          ? const Value.absent()
          : Value(isReachable),
      isSetup: isSetup == null && nullToAbsent
          ? const Value.absent()
          : Value(isSetup),
      serverID: serverID == null && nullToAbsent
          ? const Value.absent()
          : Value(serverID),
      synced:
          synced == null && nullToAbsent ? const Value.absent() : Value(synced),
    );
  }

  Device copyWith(
          {int id,
          String identifier,
          String name,
          String ip,
          String mdns,
          bool isReachable,
          bool isSetup,
          String serverID,
          bool synced}) =>
      Device(
        id: id ?? this.id,
        identifier: identifier ?? this.identifier,
        name: name ?? this.name,
        ip: ip ?? this.ip,
        mdns: mdns ?? this.mdns,
        isReachable: isReachable ?? this.isReachable,
        isSetup: isSetup ?? this.isSetup,
        serverID: serverID ?? this.serverID,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('Device(')
          ..write('id: $id, ')
          ..write('identifier: $identifier, ')
          ..write('name: $name, ')
          ..write('ip: $ip, ')
          ..write('mdns: $mdns, ')
          ..write('isReachable: $isReachable, ')
          ..write('isSetup: $isSetup, ')
          ..write('serverID: $serverID, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          identifier.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  ip.hashCode,
                  $mrjc(
                      mdns.hashCode,
                      $mrjc(
                          isReachable.hashCode,
                          $mrjc(isSetup.hashCode,
                              $mrjc(serverID.hashCode, synced.hashCode)))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Device &&
          other.id == this.id &&
          other.identifier == this.identifier &&
          other.name == this.name &&
          other.ip == this.ip &&
          other.mdns == this.mdns &&
          other.isReachable == this.isReachable &&
          other.isSetup == this.isSetup &&
          other.serverID == this.serverID &&
          other.synced == this.synced);
}

class DevicesCompanion extends UpdateCompanion<Device> {
  final Value<int> id;
  final Value<String> identifier;
  final Value<String> name;
  final Value<String> ip;
  final Value<String> mdns;
  final Value<bool> isReachable;
  final Value<bool> isSetup;
  final Value<String> serverID;
  final Value<bool> synced;
  const DevicesCompanion({
    this.id = const Value.absent(),
    this.identifier = const Value.absent(),
    this.name = const Value.absent(),
    this.ip = const Value.absent(),
    this.mdns = const Value.absent(),
    this.isReachable = const Value.absent(),
    this.isSetup = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  });
  DevicesCompanion.insert({
    this.id = const Value.absent(),
    @required String identifier,
    @required String name,
    @required String ip,
    @required String mdns,
    this.isReachable = const Value.absent(),
    this.isSetup = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  })  : identifier = Value(identifier),
        name = Value(name),
        ip = Value(ip),
        mdns = Value(mdns);
  DevicesCompanion copyWith(
      {Value<int> id,
      Value<String> identifier,
      Value<String> name,
      Value<String> ip,
      Value<String> mdns,
      Value<bool> isReachable,
      Value<bool> isSetup,
      Value<String> serverID,
      Value<bool> synced}) {
    return DevicesCompanion(
      id: id ?? this.id,
      identifier: identifier ?? this.identifier,
      name: name ?? this.name,
      ip: ip ?? this.ip,
      mdns: mdns ?? this.mdns,
      isReachable: isReachable ?? this.isReachable,
      isSetup: isSetup ?? this.isSetup,
      serverID: serverID ?? this.serverID,
      synced: synced ?? this.synced,
    );
  }
}

class $DevicesTable extends Devices with TableInfo<$DevicesTable, Device> {
  final GeneratedDatabase _db;
  final String _alias;
  $DevicesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _identifierMeta = const VerificationMeta('identifier');
  GeneratedTextColumn _identifier;
  @override
  GeneratedTextColumn get identifier => _identifier ??= _constructIdentifier();
  GeneratedTextColumn _constructIdentifier() {
    return GeneratedTextColumn('identifier', $tableName, false,
        minTextLength: 1, maxTextLength: 16);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 24);
  }

  final VerificationMeta _ipMeta = const VerificationMeta('ip');
  GeneratedTextColumn _ip;
  @override
  GeneratedTextColumn get ip => _ip ??= _constructIp();
  GeneratedTextColumn _constructIp() {
    return GeneratedTextColumn('ip', $tableName, false,
        minTextLength: 7, maxTextLength: 15);
  }

  final VerificationMeta _mdnsMeta = const VerificationMeta('mdns');
  GeneratedTextColumn _mdns;
  @override
  GeneratedTextColumn get mdns => _mdns ??= _constructMdns();
  GeneratedTextColumn _constructMdns() {
    return GeneratedTextColumn('mdns', $tableName, false,
        minTextLength: 1, maxTextLength: 64);
  }

  final VerificationMeta _isReachableMeta =
      const VerificationMeta('isReachable');
  GeneratedBoolColumn _isReachable;
  @override
  GeneratedBoolColumn get isReachable =>
      _isReachable ??= _constructIsReachable();
  GeneratedBoolColumn _constructIsReachable() {
    return GeneratedBoolColumn('is_reachable', $tableName, false,
        defaultValue: Constant(true));
  }

  final VerificationMeta _isSetupMeta = const VerificationMeta('isSetup');
  GeneratedBoolColumn _isSetup;
  @override
  GeneratedBoolColumn get isSetup => _isSetup ??= _constructIsSetup();
  GeneratedBoolColumn _constructIsSetup() {
    return GeneratedBoolColumn('is_setup', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _serverIDMeta = const VerificationMeta('serverID');
  GeneratedTextColumn _serverID;
  @override
  GeneratedTextColumn get serverID => _serverID ??= _constructServerID();
  GeneratedTextColumn _constructServerID() {
    return GeneratedTextColumn('server_i_d', $tableName, true,
        minTextLength: 36, maxTextLength: 36);
  }

  final VerificationMeta _syncedMeta = const VerificationMeta('synced');
  GeneratedBoolColumn _synced;
  @override
  GeneratedBoolColumn get synced => _synced ??= _constructSynced();
  GeneratedBoolColumn _constructSynced() {
    return GeneratedBoolColumn('synced', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, identifier, name, ip, mdns, isReachable, isSetup, serverID, synced];
  @override
  $DevicesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'devices';
  @override
  final String actualTableName = 'devices';
  @override
  VerificationContext validateIntegrity(DevicesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.identifier.present) {
      context.handle(_identifierMeta,
          identifier.isAcceptableValue(d.identifier.value, _identifierMeta));
    } else if (identifier.isRequired && isInserting) {
      context.missing(_identifierMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.ip.present) {
      context.handle(_ipMeta, ip.isAcceptableValue(d.ip.value, _ipMeta));
    } else if (ip.isRequired && isInserting) {
      context.missing(_ipMeta);
    }
    if (d.mdns.present) {
      context.handle(
          _mdnsMeta, mdns.isAcceptableValue(d.mdns.value, _mdnsMeta));
    } else if (mdns.isRequired && isInserting) {
      context.missing(_mdnsMeta);
    }
    if (d.isReachable.present) {
      context.handle(_isReachableMeta,
          isReachable.isAcceptableValue(d.isReachable.value, _isReachableMeta));
    } else if (isReachable.isRequired && isInserting) {
      context.missing(_isReachableMeta);
    }
    if (d.isSetup.present) {
      context.handle(_isSetupMeta,
          isSetup.isAcceptableValue(d.isSetup.value, _isSetupMeta));
    } else if (isSetup.isRequired && isInserting) {
      context.missing(_isSetupMeta);
    }
    if (d.serverID.present) {
      context.handle(_serverIDMeta,
          serverID.isAcceptableValue(d.serverID.value, _serverIDMeta));
    } else if (serverID.isRequired && isInserting) {
      context.missing(_serverIDMeta);
    }
    if (d.synced.present) {
      context.handle(
          _syncedMeta, synced.isAcceptableValue(d.synced.value, _syncedMeta));
    } else if (synced.isRequired && isInserting) {
      context.missing(_syncedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Device map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Device.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DevicesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.identifier.present) {
      map['identifier'] = Variable<String, StringType>(d.identifier.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.ip.present) {
      map['ip'] = Variable<String, StringType>(d.ip.value);
    }
    if (d.mdns.present) {
      map['mdns'] = Variable<String, StringType>(d.mdns.value);
    }
    if (d.isReachable.present) {
      map['is_reachable'] = Variable<bool, BoolType>(d.isReachable.value);
    }
    if (d.isSetup.present) {
      map['is_setup'] = Variable<bool, BoolType>(d.isSetup.value);
    }
    if (d.serverID.present) {
      map['server_i_d'] = Variable<String, StringType>(d.serverID.value);
    }
    if (d.synced.present) {
      map['synced'] = Variable<bool, BoolType>(d.synced.value);
    }
    return map;
  }

  @override
  $DevicesTable createAlias(String alias) {
    return $DevicesTable(_db, alias);
  }
}

class Module extends DataClass implements Insertable<Module> {
  final int id;
  final int device;
  final String name;
  final bool isArray;
  final int arrayLen;
  Module(
      {@required this.id,
      @required this.device,
      @required this.name,
      @required this.isArray,
      @required this.arrayLen});
  factory Module.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Module(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      device: intType.mapFromDatabaseResponse(data['${effectivePrefix}device']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      isArray:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_array']),
      arrayLen:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}array_len']),
    );
  }
  factory Module.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Module(
      id: serializer.fromJson<int>(json['id']),
      device: serializer.fromJson<int>(json['device']),
      name: serializer.fromJson<String>(json['name']),
      isArray: serializer.fromJson<bool>(json['isArray']),
      arrayLen: serializer.fromJson<int>(json['arrayLen']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'device': serializer.toJson<int>(device),
      'name': serializer.toJson<String>(name),
      'isArray': serializer.toJson<bool>(isArray),
      'arrayLen': serializer.toJson<int>(arrayLen),
    };
  }

  @override
  ModulesCompanion createCompanion(bool nullToAbsent) {
    return ModulesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      device:
          device == null && nullToAbsent ? const Value.absent() : Value(device),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      isArray: isArray == null && nullToAbsent
          ? const Value.absent()
          : Value(isArray),
      arrayLen: arrayLen == null && nullToAbsent
          ? const Value.absent()
          : Value(arrayLen),
    );
  }

  Module copyWith(
          {int id, int device, String name, bool isArray, int arrayLen}) =>
      Module(
        id: id ?? this.id,
        device: device ?? this.device,
        name: name ?? this.name,
        isArray: isArray ?? this.isArray,
        arrayLen: arrayLen ?? this.arrayLen,
      );
  @override
  String toString() {
    return (StringBuffer('Module(')
          ..write('id: $id, ')
          ..write('device: $device, ')
          ..write('name: $name, ')
          ..write('isArray: $isArray, ')
          ..write('arrayLen: $arrayLen')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(device.hashCode,
          $mrjc(name.hashCode, $mrjc(isArray.hashCode, arrayLen.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Module &&
          other.id == this.id &&
          other.device == this.device &&
          other.name == this.name &&
          other.isArray == this.isArray &&
          other.arrayLen == this.arrayLen);
}

class ModulesCompanion extends UpdateCompanion<Module> {
  final Value<int> id;
  final Value<int> device;
  final Value<String> name;
  final Value<bool> isArray;
  final Value<int> arrayLen;
  const ModulesCompanion({
    this.id = const Value.absent(),
    this.device = const Value.absent(),
    this.name = const Value.absent(),
    this.isArray = const Value.absent(),
    this.arrayLen = const Value.absent(),
  });
  ModulesCompanion.insert({
    this.id = const Value.absent(),
    @required int device,
    @required String name,
    @required bool isArray,
    @required int arrayLen,
  })  : device = Value(device),
        name = Value(name),
        isArray = Value(isArray),
        arrayLen = Value(arrayLen);
  ModulesCompanion copyWith(
      {Value<int> id,
      Value<int> device,
      Value<String> name,
      Value<bool> isArray,
      Value<int> arrayLen}) {
    return ModulesCompanion(
      id: id ?? this.id,
      device: device ?? this.device,
      name: name ?? this.name,
      isArray: isArray ?? this.isArray,
      arrayLen: arrayLen ?? this.arrayLen,
    );
  }
}

class $ModulesTable extends Modules with TableInfo<$ModulesTable, Module> {
  final GeneratedDatabase _db;
  final String _alias;
  $ModulesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _deviceMeta = const VerificationMeta('device');
  GeneratedIntColumn _device;
  @override
  GeneratedIntColumn get device => _device ??= _constructDevice();
  GeneratedIntColumn _constructDevice() {
    return GeneratedIntColumn(
      'device',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 24);
  }

  final VerificationMeta _isArrayMeta = const VerificationMeta('isArray');
  GeneratedBoolColumn _isArray;
  @override
  GeneratedBoolColumn get isArray => _isArray ??= _constructIsArray();
  GeneratedBoolColumn _constructIsArray() {
    return GeneratedBoolColumn(
      'is_array',
      $tableName,
      false,
    );
  }

  final VerificationMeta _arrayLenMeta = const VerificationMeta('arrayLen');
  GeneratedIntColumn _arrayLen;
  @override
  GeneratedIntColumn get arrayLen => _arrayLen ??= _constructArrayLen();
  GeneratedIntColumn _constructArrayLen() {
    return GeneratedIntColumn(
      'array_len',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, device, name, isArray, arrayLen];
  @override
  $ModulesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'modules';
  @override
  final String actualTableName = 'modules';
  @override
  VerificationContext validateIntegrity(ModulesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.device.present) {
      context.handle(
          _deviceMeta, device.isAcceptableValue(d.device.value, _deviceMeta));
    } else if (device.isRequired && isInserting) {
      context.missing(_deviceMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.isArray.present) {
      context.handle(_isArrayMeta,
          isArray.isAcceptableValue(d.isArray.value, _isArrayMeta));
    } else if (isArray.isRequired && isInserting) {
      context.missing(_isArrayMeta);
    }
    if (d.arrayLen.present) {
      context.handle(_arrayLenMeta,
          arrayLen.isAcceptableValue(d.arrayLen.value, _arrayLenMeta));
    } else if (arrayLen.isRequired && isInserting) {
      context.missing(_arrayLenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Module map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Module.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ModulesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.device.present) {
      map['device'] = Variable<int, IntType>(d.device.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.isArray.present) {
      map['is_array'] = Variable<bool, BoolType>(d.isArray.value);
    }
    if (d.arrayLen.present) {
      map['array_len'] = Variable<int, IntType>(d.arrayLen.value);
    }
    return map;
  }

  @override
  $ModulesTable createAlias(String alias) {
    return $ModulesTable(_db, alias);
  }
}

class Param extends DataClass implements Insertable<Param> {
  final int id;
  final int device;
  final int module;
  final String key;
  final int type;
  final String svalue;
  final int ivalue;
  Param(
      {@required this.id,
      @required this.device,
      @required this.module,
      @required this.key,
      @required this.type,
      this.svalue,
      this.ivalue});
  factory Param.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Param(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      device: intType.mapFromDatabaseResponse(data['${effectivePrefix}device']),
      module: intType.mapFromDatabaseResponse(data['${effectivePrefix}module']),
      key: stringType.mapFromDatabaseResponse(data['${effectivePrefix}key']),
      type: intType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      svalue:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}svalue']),
      ivalue: intType.mapFromDatabaseResponse(data['${effectivePrefix}ivalue']),
    );
  }
  factory Param.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Param(
      id: serializer.fromJson<int>(json['id']),
      device: serializer.fromJson<int>(json['device']),
      module: serializer.fromJson<int>(json['module']),
      key: serializer.fromJson<String>(json['key']),
      type: serializer.fromJson<int>(json['type']),
      svalue: serializer.fromJson<String>(json['svalue']),
      ivalue: serializer.fromJson<int>(json['ivalue']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'device': serializer.toJson<int>(device),
      'module': serializer.toJson<int>(module),
      'key': serializer.toJson<String>(key),
      'type': serializer.toJson<int>(type),
      'svalue': serializer.toJson<String>(svalue),
      'ivalue': serializer.toJson<int>(ivalue),
    };
  }

  @override
  ParamsCompanion createCompanion(bool nullToAbsent) {
    return ParamsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      device:
          device == null && nullToAbsent ? const Value.absent() : Value(device),
      module:
          module == null && nullToAbsent ? const Value.absent() : Value(module),
      key: key == null && nullToAbsent ? const Value.absent() : Value(key),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      svalue:
          svalue == null && nullToAbsent ? const Value.absent() : Value(svalue),
      ivalue:
          ivalue == null && nullToAbsent ? const Value.absent() : Value(ivalue),
    );
  }

  Param copyWith(
          {int id,
          int device,
          int module,
          String key,
          int type,
          String svalue,
          int ivalue}) =>
      Param(
        id: id ?? this.id,
        device: device ?? this.device,
        module: module ?? this.module,
        key: key ?? this.key,
        type: type ?? this.type,
        svalue: svalue ?? this.svalue,
        ivalue: ivalue ?? this.ivalue,
      );
  @override
  String toString() {
    return (StringBuffer('Param(')
          ..write('id: $id, ')
          ..write('device: $device, ')
          ..write('module: $module, ')
          ..write('key: $key, ')
          ..write('type: $type, ')
          ..write('svalue: $svalue, ')
          ..write('ivalue: $ivalue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          device.hashCode,
          $mrjc(
              module.hashCode,
              $mrjc(
                  key.hashCode,
                  $mrjc(type.hashCode,
                      $mrjc(svalue.hashCode, ivalue.hashCode)))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Param &&
          other.id == this.id &&
          other.device == this.device &&
          other.module == this.module &&
          other.key == this.key &&
          other.type == this.type &&
          other.svalue == this.svalue &&
          other.ivalue == this.ivalue);
}

class ParamsCompanion extends UpdateCompanion<Param> {
  final Value<int> id;
  final Value<int> device;
  final Value<int> module;
  final Value<String> key;
  final Value<int> type;
  final Value<String> svalue;
  final Value<int> ivalue;
  const ParamsCompanion({
    this.id = const Value.absent(),
    this.device = const Value.absent(),
    this.module = const Value.absent(),
    this.key = const Value.absent(),
    this.type = const Value.absent(),
    this.svalue = const Value.absent(),
    this.ivalue = const Value.absent(),
  });
  ParamsCompanion.insert({
    this.id = const Value.absent(),
    @required int device,
    @required int module,
    @required String key,
    @required int type,
    this.svalue = const Value.absent(),
    this.ivalue = const Value.absent(),
  })  : device = Value(device),
        module = Value(module),
        key = Value(key),
        type = Value(type);
  ParamsCompanion copyWith(
      {Value<int> id,
      Value<int> device,
      Value<int> module,
      Value<String> key,
      Value<int> type,
      Value<String> svalue,
      Value<int> ivalue}) {
    return ParamsCompanion(
      id: id ?? this.id,
      device: device ?? this.device,
      module: module ?? this.module,
      key: key ?? this.key,
      type: type ?? this.type,
      svalue: svalue ?? this.svalue,
      ivalue: ivalue ?? this.ivalue,
    );
  }
}

class $ParamsTable extends Params with TableInfo<$ParamsTable, Param> {
  final GeneratedDatabase _db;
  final String _alias;
  $ParamsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _deviceMeta = const VerificationMeta('device');
  GeneratedIntColumn _device;
  @override
  GeneratedIntColumn get device => _device ??= _constructDevice();
  GeneratedIntColumn _constructDevice() {
    return GeneratedIntColumn(
      'device',
      $tableName,
      false,
    );
  }

  final VerificationMeta _moduleMeta = const VerificationMeta('module');
  GeneratedIntColumn _module;
  @override
  GeneratedIntColumn get module => _module ??= _constructModule();
  GeneratedIntColumn _constructModule() {
    return GeneratedIntColumn(
      'module',
      $tableName,
      false,
    );
  }

  final VerificationMeta _keyMeta = const VerificationMeta('key');
  GeneratedTextColumn _key;
  @override
  GeneratedTextColumn get key => _key ??= _constructKey();
  GeneratedTextColumn _constructKey() {
    return GeneratedTextColumn('key', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedIntColumn _type;
  @override
  GeneratedIntColumn get type => _type ??= _constructType();
  GeneratedIntColumn _constructType() {
    return GeneratedIntColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _svalueMeta = const VerificationMeta('svalue');
  GeneratedTextColumn _svalue;
  @override
  GeneratedTextColumn get svalue => _svalue ??= _constructSvalue();
  GeneratedTextColumn _constructSvalue() {
    return GeneratedTextColumn('svalue', $tableName, true,
        minTextLength: 0, maxTextLength: 64);
  }

  final VerificationMeta _ivalueMeta = const VerificationMeta('ivalue');
  GeneratedIntColumn _ivalue;
  @override
  GeneratedIntColumn get ivalue => _ivalue ??= _constructIvalue();
  GeneratedIntColumn _constructIvalue() {
    return GeneratedIntColumn(
      'ivalue',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, device, module, key, type, svalue, ivalue];
  @override
  $ParamsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'params';
  @override
  final String actualTableName = 'params';
  @override
  VerificationContext validateIntegrity(ParamsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.device.present) {
      context.handle(
          _deviceMeta, device.isAcceptableValue(d.device.value, _deviceMeta));
    } else if (device.isRequired && isInserting) {
      context.missing(_deviceMeta);
    }
    if (d.module.present) {
      context.handle(
          _moduleMeta, module.isAcceptableValue(d.module.value, _moduleMeta));
    } else if (module.isRequired && isInserting) {
      context.missing(_moduleMeta);
    }
    if (d.key.present) {
      context.handle(_keyMeta, key.isAcceptableValue(d.key.value, _keyMeta));
    } else if (key.isRequired && isInserting) {
      context.missing(_keyMeta);
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    } else if (type.isRequired && isInserting) {
      context.missing(_typeMeta);
    }
    if (d.svalue.present) {
      context.handle(
          _svalueMeta, svalue.isAcceptableValue(d.svalue.value, _svalueMeta));
    } else if (svalue.isRequired && isInserting) {
      context.missing(_svalueMeta);
    }
    if (d.ivalue.present) {
      context.handle(
          _ivalueMeta, ivalue.isAcceptableValue(d.ivalue.value, _ivalueMeta));
    } else if (ivalue.isRequired && isInserting) {
      context.missing(_ivalueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Param map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Param.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ParamsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.device.present) {
      map['device'] = Variable<int, IntType>(d.device.value);
    }
    if (d.module.present) {
      map['module'] = Variable<int, IntType>(d.module.value);
    }
    if (d.key.present) {
      map['key'] = Variable<String, StringType>(d.key.value);
    }
    if (d.type.present) {
      map['type'] = Variable<int, IntType>(d.type.value);
    }
    if (d.svalue.present) {
      map['svalue'] = Variable<String, StringType>(d.svalue.value);
    }
    if (d.ivalue.present) {
      map['ivalue'] = Variable<int, IntType>(d.ivalue.value);
    }
    return map;
  }

  @override
  $ParamsTable createAlias(String alias) {
    return $ParamsTable(_db, alias);
  }
}

class Plant extends DataClass implements Insertable<Plant> {
  final int id;
  final int feed;
  final int box;
  final String name;
  final bool single;
  final bool public;
  final String settings;
  final String serverID;
  final bool synced;
  Plant(
      {@required this.id,
      @required this.feed,
      this.box,
      @required this.name,
      @required this.single,
      @required this.public,
      @required this.settings,
      this.serverID,
      @required this.synced});
  factory Plant.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Plant(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      feed: intType.mapFromDatabaseResponse(data['${effectivePrefix}feed']),
      box: intType.mapFromDatabaseResponse(data['${effectivePrefix}box']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      single:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}single']),
      public:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}public']),
      settings: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}settings']),
      serverID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}server_i_d']),
      synced:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}synced']),
    );
  }
  factory Plant.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Plant(
      id: serializer.fromJson<int>(json['id']),
      feed: serializer.fromJson<int>(json['feed']),
      box: serializer.fromJson<int>(json['box']),
      name: serializer.fromJson<String>(json['name']),
      single: serializer.fromJson<bool>(json['single']),
      public: serializer.fromJson<bool>(json['public']),
      settings: serializer.fromJson<String>(json['settings']),
      serverID: serializer.fromJson<String>(json['serverID']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'feed': serializer.toJson<int>(feed),
      'box': serializer.toJson<int>(box),
      'name': serializer.toJson<String>(name),
      'single': serializer.toJson<bool>(single),
      'public': serializer.toJson<bool>(public),
      'settings': serializer.toJson<String>(settings),
      'serverID': serializer.toJson<String>(serverID),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  @override
  PlantsCompanion createCompanion(bool nullToAbsent) {
    return PlantsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      feed: feed == null && nullToAbsent ? const Value.absent() : Value(feed),
      box: box == null && nullToAbsent ? const Value.absent() : Value(box),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      single:
          single == null && nullToAbsent ? const Value.absent() : Value(single),
      public:
          public == null && nullToAbsent ? const Value.absent() : Value(public),
      settings: settings == null && nullToAbsent
          ? const Value.absent()
          : Value(settings),
      serverID: serverID == null && nullToAbsent
          ? const Value.absent()
          : Value(serverID),
      synced:
          synced == null && nullToAbsent ? const Value.absent() : Value(synced),
    );
  }

  Plant copyWith(
          {int id,
          int feed,
          int box,
          String name,
          bool single,
          bool public,
          String settings,
          String serverID,
          bool synced}) =>
      Plant(
        id: id ?? this.id,
        feed: feed ?? this.feed,
        box: box ?? this.box,
        name: name ?? this.name,
        single: single ?? this.single,
        public: public ?? this.public,
        settings: settings ?? this.settings,
        serverID: serverID ?? this.serverID,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('Plant(')
          ..write('id: $id, ')
          ..write('feed: $feed, ')
          ..write('box: $box, ')
          ..write('name: $name, ')
          ..write('single: $single, ')
          ..write('public: $public, ')
          ..write('settings: $settings, ')
          ..write('serverID: $serverID, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          feed.hashCode,
          $mrjc(
              box.hashCode,
              $mrjc(
                  name.hashCode,
                  $mrjc(
                      single.hashCode,
                      $mrjc(
                          public.hashCode,
                          $mrjc(settings.hashCode,
                              $mrjc(serverID.hashCode, synced.hashCode)))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Plant &&
          other.id == this.id &&
          other.feed == this.feed &&
          other.box == this.box &&
          other.name == this.name &&
          other.single == this.single &&
          other.public == this.public &&
          other.settings == this.settings &&
          other.serverID == this.serverID &&
          other.synced == this.synced);
}

class PlantsCompanion extends UpdateCompanion<Plant> {
  final Value<int> id;
  final Value<int> feed;
  final Value<int> box;
  final Value<String> name;
  final Value<bool> single;
  final Value<bool> public;
  final Value<String> settings;
  final Value<String> serverID;
  final Value<bool> synced;
  const PlantsCompanion({
    this.id = const Value.absent(),
    this.feed = const Value.absent(),
    this.box = const Value.absent(),
    this.name = const Value.absent(),
    this.single = const Value.absent(),
    this.public = const Value.absent(),
    this.settings = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  });
  PlantsCompanion.insert({
    this.id = const Value.absent(),
    @required int feed,
    this.box = const Value.absent(),
    @required String name,
    this.single = const Value.absent(),
    this.public = const Value.absent(),
    this.settings = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  })  : feed = Value(feed),
        name = Value(name);
  PlantsCompanion copyWith(
      {Value<int> id,
      Value<int> feed,
      Value<int> box,
      Value<String> name,
      Value<bool> single,
      Value<bool> public,
      Value<String> settings,
      Value<String> serverID,
      Value<bool> synced}) {
    return PlantsCompanion(
      id: id ?? this.id,
      feed: feed ?? this.feed,
      box: box ?? this.box,
      name: name ?? this.name,
      single: single ?? this.single,
      public: public ?? this.public,
      settings: settings ?? this.settings,
      serverID: serverID ?? this.serverID,
      synced: synced ?? this.synced,
    );
  }
}

class $PlantsTable extends Plants with TableInfo<$PlantsTable, Plant> {
  final GeneratedDatabase _db;
  final String _alias;
  $PlantsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _feedMeta = const VerificationMeta('feed');
  GeneratedIntColumn _feed;
  @override
  GeneratedIntColumn get feed => _feed ??= _constructFeed();
  GeneratedIntColumn _constructFeed() {
    return GeneratedIntColumn(
      'feed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _boxMeta = const VerificationMeta('box');
  GeneratedIntColumn _box;
  @override
  GeneratedIntColumn get box => _box ??= _constructBox();
  GeneratedIntColumn _constructBox() {
    return GeneratedIntColumn(
      'box',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 32);
  }

  final VerificationMeta _singleMeta = const VerificationMeta('single');
  GeneratedBoolColumn _single;
  @override
  GeneratedBoolColumn get single => _single ??= _constructSingle();
  GeneratedBoolColumn _constructSingle() {
    return GeneratedBoolColumn('single', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _publicMeta = const VerificationMeta('public');
  GeneratedBoolColumn _public;
  @override
  GeneratedBoolColumn get public => _public ??= _constructPublic();
  GeneratedBoolColumn _constructPublic() {
    return GeneratedBoolColumn('public', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _settingsMeta = const VerificationMeta('settings');
  GeneratedTextColumn _settings;
  @override
  GeneratedTextColumn get settings => _settings ??= _constructSettings();
  GeneratedTextColumn _constructSettings() {
    return GeneratedTextColumn('settings', $tableName, false,
        defaultValue: Constant('{}'));
  }

  final VerificationMeta _serverIDMeta = const VerificationMeta('serverID');
  GeneratedTextColumn _serverID;
  @override
  GeneratedTextColumn get serverID => _serverID ??= _constructServerID();
  GeneratedTextColumn _constructServerID() {
    return GeneratedTextColumn('server_i_d', $tableName, true,
        minTextLength: 36, maxTextLength: 36);
  }

  final VerificationMeta _syncedMeta = const VerificationMeta('synced');
  GeneratedBoolColumn _synced;
  @override
  GeneratedBoolColumn get synced => _synced ??= _constructSynced();
  GeneratedBoolColumn _constructSynced() {
    return GeneratedBoolColumn('synced', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, feed, box, name, single, public, settings, serverID, synced];
  @override
  $PlantsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'plants';
  @override
  final String actualTableName = 'plants';
  @override
  VerificationContext validateIntegrity(PlantsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.feed.present) {
      context.handle(
          _feedMeta, feed.isAcceptableValue(d.feed.value, _feedMeta));
    } else if (feed.isRequired && isInserting) {
      context.missing(_feedMeta);
    }
    if (d.box.present) {
      context.handle(_boxMeta, box.isAcceptableValue(d.box.value, _boxMeta));
    } else if (box.isRequired && isInserting) {
      context.missing(_boxMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.single.present) {
      context.handle(
          _singleMeta, single.isAcceptableValue(d.single.value, _singleMeta));
    } else if (single.isRequired && isInserting) {
      context.missing(_singleMeta);
    }
    if (d.public.present) {
      context.handle(
          _publicMeta, public.isAcceptableValue(d.public.value, _publicMeta));
    } else if (public.isRequired && isInserting) {
      context.missing(_publicMeta);
    }
    if (d.settings.present) {
      context.handle(_settingsMeta,
          settings.isAcceptableValue(d.settings.value, _settingsMeta));
    } else if (settings.isRequired && isInserting) {
      context.missing(_settingsMeta);
    }
    if (d.serverID.present) {
      context.handle(_serverIDMeta,
          serverID.isAcceptableValue(d.serverID.value, _serverIDMeta));
    } else if (serverID.isRequired && isInserting) {
      context.missing(_serverIDMeta);
    }
    if (d.synced.present) {
      context.handle(
          _syncedMeta, synced.isAcceptableValue(d.synced.value, _syncedMeta));
    } else if (synced.isRequired && isInserting) {
      context.missing(_syncedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Plant map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Plant.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(PlantsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.feed.present) {
      map['feed'] = Variable<int, IntType>(d.feed.value);
    }
    if (d.box.present) {
      map['box'] = Variable<int, IntType>(d.box.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.single.present) {
      map['single'] = Variable<bool, BoolType>(d.single.value);
    }
    if (d.public.present) {
      map['public'] = Variable<bool, BoolType>(d.public.value);
    }
    if (d.settings.present) {
      map['settings'] = Variable<String, StringType>(d.settings.value);
    }
    if (d.serverID.present) {
      map['server_i_d'] = Variable<String, StringType>(d.serverID.value);
    }
    if (d.synced.present) {
      map['synced'] = Variable<bool, BoolType>(d.synced.value);
    }
    return map;
  }

  @override
  $PlantsTable createAlias(String alias) {
    return $PlantsTable(_db, alias);
  }
}

class Box extends DataClass implements Insertable<Box> {
  final int id;
  final int feed;
  final int device;
  final int deviceBox;
  final String name;
  final String settings;
  final String serverID;
  final bool synced;
  Box(
      {@required this.id,
      @required this.feed,
      this.device,
      this.deviceBox,
      @required this.name,
      @required this.settings,
      this.serverID,
      @required this.synced});
  factory Box.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Box(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      feed: intType.mapFromDatabaseResponse(data['${effectivePrefix}feed']),
      device: intType.mapFromDatabaseResponse(data['${effectivePrefix}device']),
      deviceBox:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}device_box']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      settings: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}settings']),
      serverID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}server_i_d']),
      synced:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}synced']),
    );
  }
  factory Box.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Box(
      id: serializer.fromJson<int>(json['id']),
      feed: serializer.fromJson<int>(json['feed']),
      device: serializer.fromJson<int>(json['device']),
      deviceBox: serializer.fromJson<int>(json['deviceBox']),
      name: serializer.fromJson<String>(json['name']),
      settings: serializer.fromJson<String>(json['settings']),
      serverID: serializer.fromJson<String>(json['serverID']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'feed': serializer.toJson<int>(feed),
      'device': serializer.toJson<int>(device),
      'deviceBox': serializer.toJson<int>(deviceBox),
      'name': serializer.toJson<String>(name),
      'settings': serializer.toJson<String>(settings),
      'serverID': serializer.toJson<String>(serverID),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  @override
  BoxesCompanion createCompanion(bool nullToAbsent) {
    return BoxesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      feed: feed == null && nullToAbsent ? const Value.absent() : Value(feed),
      device:
          device == null && nullToAbsent ? const Value.absent() : Value(device),
      deviceBox: deviceBox == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceBox),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      settings: settings == null && nullToAbsent
          ? const Value.absent()
          : Value(settings),
      serverID: serverID == null && nullToAbsent
          ? const Value.absent()
          : Value(serverID),
      synced:
          synced == null && nullToAbsent ? const Value.absent() : Value(synced),
    );
  }

  Box copyWith(
          {int id,
          int feed,
          int device,
          int deviceBox,
          String name,
          String settings,
          String serverID,
          bool synced}) =>
      Box(
        id: id ?? this.id,
        feed: feed ?? this.feed,
        device: device ?? this.device,
        deviceBox: deviceBox ?? this.deviceBox,
        name: name ?? this.name,
        settings: settings ?? this.settings,
        serverID: serverID ?? this.serverID,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('Box(')
          ..write('id: $id, ')
          ..write('feed: $feed, ')
          ..write('device: $device, ')
          ..write('deviceBox: $deviceBox, ')
          ..write('name: $name, ')
          ..write('settings: $settings, ')
          ..write('serverID: $serverID, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          feed.hashCode,
          $mrjc(
              device.hashCode,
              $mrjc(
                  deviceBox.hashCode,
                  $mrjc(
                      name.hashCode,
                      $mrjc(settings.hashCode,
                          $mrjc(serverID.hashCode, synced.hashCode))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Box &&
          other.id == this.id &&
          other.feed == this.feed &&
          other.device == this.device &&
          other.deviceBox == this.deviceBox &&
          other.name == this.name &&
          other.settings == this.settings &&
          other.serverID == this.serverID &&
          other.synced == this.synced);
}

class BoxesCompanion extends UpdateCompanion<Box> {
  final Value<int> id;
  final Value<int> feed;
  final Value<int> device;
  final Value<int> deviceBox;
  final Value<String> name;
  final Value<String> settings;
  final Value<String> serverID;
  final Value<bool> synced;
  const BoxesCompanion({
    this.id = const Value.absent(),
    this.feed = const Value.absent(),
    this.device = const Value.absent(),
    this.deviceBox = const Value.absent(),
    this.name = const Value.absent(),
    this.settings = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  });
  BoxesCompanion.insert({
    this.id = const Value.absent(),
    @required int feed,
    this.device = const Value.absent(),
    this.deviceBox = const Value.absent(),
    @required String name,
    this.settings = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  })  : feed = Value(feed),
        name = Value(name);
  BoxesCompanion copyWith(
      {Value<int> id,
      Value<int> feed,
      Value<int> device,
      Value<int> deviceBox,
      Value<String> name,
      Value<String> settings,
      Value<String> serverID,
      Value<bool> synced}) {
    return BoxesCompanion(
      id: id ?? this.id,
      feed: feed ?? this.feed,
      device: device ?? this.device,
      deviceBox: deviceBox ?? this.deviceBox,
      name: name ?? this.name,
      settings: settings ?? this.settings,
      serverID: serverID ?? this.serverID,
      synced: synced ?? this.synced,
    );
  }
}

class $BoxesTable extends Boxes with TableInfo<$BoxesTable, Box> {
  final GeneratedDatabase _db;
  final String _alias;
  $BoxesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _feedMeta = const VerificationMeta('feed');
  GeneratedIntColumn _feed;
  @override
  GeneratedIntColumn get feed => _feed ??= _constructFeed();
  GeneratedIntColumn _constructFeed() {
    return GeneratedIntColumn(
      'feed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _deviceMeta = const VerificationMeta('device');
  GeneratedIntColumn _device;
  @override
  GeneratedIntColumn get device => _device ??= _constructDevice();
  GeneratedIntColumn _constructDevice() {
    return GeneratedIntColumn(
      'device',
      $tableName,
      true,
    );
  }

  final VerificationMeta _deviceBoxMeta = const VerificationMeta('deviceBox');
  GeneratedIntColumn _deviceBox;
  @override
  GeneratedIntColumn get deviceBox => _deviceBox ??= _constructDeviceBox();
  GeneratedIntColumn _constructDeviceBox() {
    return GeneratedIntColumn(
      'device_box',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 32);
  }

  final VerificationMeta _settingsMeta = const VerificationMeta('settings');
  GeneratedTextColumn _settings;
  @override
  GeneratedTextColumn get settings => _settings ??= _constructSettings();
  GeneratedTextColumn _constructSettings() {
    return GeneratedTextColumn('settings', $tableName, false,
        defaultValue: Constant('{}'));
  }

  final VerificationMeta _serverIDMeta = const VerificationMeta('serverID');
  GeneratedTextColumn _serverID;
  @override
  GeneratedTextColumn get serverID => _serverID ??= _constructServerID();
  GeneratedTextColumn _constructServerID() {
    return GeneratedTextColumn('server_i_d', $tableName, true,
        minTextLength: 36, maxTextLength: 36);
  }

  final VerificationMeta _syncedMeta = const VerificationMeta('synced');
  GeneratedBoolColumn _synced;
  @override
  GeneratedBoolColumn get synced => _synced ??= _constructSynced();
  GeneratedBoolColumn _constructSynced() {
    return GeneratedBoolColumn('synced', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, feed, device, deviceBox, name, settings, serverID, synced];
  @override
  $BoxesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'boxes';
  @override
  final String actualTableName = 'boxes';
  @override
  VerificationContext validateIntegrity(BoxesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.feed.present) {
      context.handle(
          _feedMeta, feed.isAcceptableValue(d.feed.value, _feedMeta));
    } else if (feed.isRequired && isInserting) {
      context.missing(_feedMeta);
    }
    if (d.device.present) {
      context.handle(
          _deviceMeta, device.isAcceptableValue(d.device.value, _deviceMeta));
    } else if (device.isRequired && isInserting) {
      context.missing(_deviceMeta);
    }
    if (d.deviceBox.present) {
      context.handle(_deviceBoxMeta,
          deviceBox.isAcceptableValue(d.deviceBox.value, _deviceBoxMeta));
    } else if (deviceBox.isRequired && isInserting) {
      context.missing(_deviceBoxMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.settings.present) {
      context.handle(_settingsMeta,
          settings.isAcceptableValue(d.settings.value, _settingsMeta));
    } else if (settings.isRequired && isInserting) {
      context.missing(_settingsMeta);
    }
    if (d.serverID.present) {
      context.handle(_serverIDMeta,
          serverID.isAcceptableValue(d.serverID.value, _serverIDMeta));
    } else if (serverID.isRequired && isInserting) {
      context.missing(_serverIDMeta);
    }
    if (d.synced.present) {
      context.handle(
          _syncedMeta, synced.isAcceptableValue(d.synced.value, _syncedMeta));
    } else if (synced.isRequired && isInserting) {
      context.missing(_syncedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Box map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Box.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(BoxesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.feed.present) {
      map['feed'] = Variable<int, IntType>(d.feed.value);
    }
    if (d.device.present) {
      map['device'] = Variable<int, IntType>(d.device.value);
    }
    if (d.deviceBox.present) {
      map['device_box'] = Variable<int, IntType>(d.deviceBox.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.settings.present) {
      map['settings'] = Variable<String, StringType>(d.settings.value);
    }
    if (d.serverID.present) {
      map['server_i_d'] = Variable<String, StringType>(d.serverID.value);
    }
    if (d.synced.present) {
      map['synced'] = Variable<bool, BoolType>(d.synced.value);
    }
    return map;
  }

  @override
  $BoxesTable createAlias(String alias) {
    return $BoxesTable(_db, alias);
  }
}

class ChartCache extends DataClass implements Insertable<ChartCache> {
  final int id;
  final int plant;
  final String name;
  final DateTime date;
  final String values;
  ChartCache(
      {@required this.id,
      @required this.plant,
      @required this.name,
      @required this.date,
      @required this.values});
  factory ChartCache.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ChartCache(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      plant: intType.mapFromDatabaseResponse(data['${effectivePrefix}plant']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      values:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}values']),
    );
  }
  factory ChartCache.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return ChartCache(
      id: serializer.fromJson<int>(json['id']),
      plant: serializer.fromJson<int>(json['plant']),
      name: serializer.fromJson<String>(json['name']),
      date: serializer.fromJson<DateTime>(json['date']),
      values: serializer.fromJson<String>(json['values']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'plant': serializer.toJson<int>(plant),
      'name': serializer.toJson<String>(name),
      'date': serializer.toJson<DateTime>(date),
      'values': serializer.toJson<String>(values),
    };
  }

  @override
  ChartCachesCompanion createCompanion(bool nullToAbsent) {
    return ChartCachesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      plant:
          plant == null && nullToAbsent ? const Value.absent() : Value(plant),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      values:
          values == null && nullToAbsent ? const Value.absent() : Value(values),
    );
  }

  ChartCache copyWith(
          {int id, int plant, String name, DateTime date, String values}) =>
      ChartCache(
        id: id ?? this.id,
        plant: plant ?? this.plant,
        name: name ?? this.name,
        date: date ?? this.date,
        values: values ?? this.values,
      );
  @override
  String toString() {
    return (StringBuffer('ChartCache(')
          ..write('id: $id, ')
          ..write('plant: $plant, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('values: $values')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(plant.hashCode,
          $mrjc(name.hashCode, $mrjc(date.hashCode, values.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is ChartCache &&
          other.id == this.id &&
          other.plant == this.plant &&
          other.name == this.name &&
          other.date == this.date &&
          other.values == this.values);
}

class ChartCachesCompanion extends UpdateCompanion<ChartCache> {
  final Value<int> id;
  final Value<int> plant;
  final Value<String> name;
  final Value<DateTime> date;
  final Value<String> values;
  const ChartCachesCompanion({
    this.id = const Value.absent(),
    this.plant = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
    this.values = const Value.absent(),
  });
  ChartCachesCompanion.insert({
    this.id = const Value.absent(),
    @required int plant,
    @required String name,
    @required DateTime date,
    this.values = const Value.absent(),
  })  : plant = Value(plant),
        name = Value(name),
        date = Value(date);
  ChartCachesCompanion copyWith(
      {Value<int> id,
      Value<int> plant,
      Value<String> name,
      Value<DateTime> date,
      Value<String> values}) {
    return ChartCachesCompanion(
      id: id ?? this.id,
      plant: plant ?? this.plant,
      name: name ?? this.name,
      date: date ?? this.date,
      values: values ?? this.values,
    );
  }
}

class $ChartCachesTable extends ChartCaches
    with TableInfo<$ChartCachesTable, ChartCache> {
  final GeneratedDatabase _db;
  final String _alias;
  $ChartCachesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _plantMeta = const VerificationMeta('plant');
  GeneratedIntColumn _plant;
  @override
  GeneratedIntColumn get plant => _plant ??= _constructPlant();
  GeneratedIntColumn _constructPlant() {
    return GeneratedIntColumn(
      'plant',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 32);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _valuesMeta = const VerificationMeta('values');
  GeneratedTextColumn _values;
  @override
  GeneratedTextColumn get values => _values ??= _constructValues();
  GeneratedTextColumn _constructValues() {
    return GeneratedTextColumn('values', $tableName, false,
        defaultValue: Constant('[]'));
  }

  @override
  List<GeneratedColumn> get $columns => [id, plant, name, date, values];
  @override
  $ChartCachesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chart_caches';
  @override
  final String actualTableName = 'chart_caches';
  @override
  VerificationContext validateIntegrity(ChartCachesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.plant.present) {
      context.handle(
          _plantMeta, plant.isAcceptableValue(d.plant.value, _plantMeta));
    } else if (plant.isRequired && isInserting) {
      context.missing(_plantMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    if (d.values.present) {
      context.handle(
          _valuesMeta, values.isAcceptableValue(d.values.value, _valuesMeta));
    } else if (values.isRequired && isInserting) {
      context.missing(_valuesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChartCache map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ChartCache.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ChartCachesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.plant.present) {
      map['plant'] = Variable<int, IntType>(d.plant.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    if (d.values.present) {
      map['values'] = Variable<String, StringType>(d.values.value);
    }
    return map;
  }

  @override
  $ChartCachesTable createAlias(String alias) {
    return $ChartCachesTable(_db, alias);
  }
}

class Timelapse extends DataClass implements Insertable<Timelapse> {
  final int id;
  final int plant;
  final String ssid;
  final String password;
  final String controllerID;
  final String rotate;
  final String name;
  final String strain;
  final String dropboxToken;
  final String uploadName;
  final String serverID;
  final bool synced;
  Timelapse(
      {@required this.id,
      @required this.plant,
      this.ssid,
      this.password,
      this.controllerID,
      this.rotate,
      this.name,
      this.strain,
      this.dropboxToken,
      this.uploadName,
      this.serverID,
      @required this.synced});
  factory Timelapse.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Timelapse(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      plant: intType.mapFromDatabaseResponse(data['${effectivePrefix}plant']),
      ssid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}ssid']),
      password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
      controllerID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}controller_i_d']),
      rotate:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}rotate']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      strain:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}strain']),
      dropboxToken: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}dropbox_token']),
      uploadName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}upload_name']),
      serverID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}server_i_d']),
      synced:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}synced']),
    );
  }
  factory Timelapse.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Timelapse(
      id: serializer.fromJson<int>(json['id']),
      plant: serializer.fromJson<int>(json['plant']),
      ssid: serializer.fromJson<String>(json['ssid']),
      password: serializer.fromJson<String>(json['password']),
      controllerID: serializer.fromJson<String>(json['controllerID']),
      rotate: serializer.fromJson<String>(json['rotate']),
      name: serializer.fromJson<String>(json['name']),
      strain: serializer.fromJson<String>(json['strain']),
      dropboxToken: serializer.fromJson<String>(json['dropboxToken']),
      uploadName: serializer.fromJson<String>(json['uploadName']),
      serverID: serializer.fromJson<String>(json['serverID']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'plant': serializer.toJson<int>(plant),
      'ssid': serializer.toJson<String>(ssid),
      'password': serializer.toJson<String>(password),
      'controllerID': serializer.toJson<String>(controllerID),
      'rotate': serializer.toJson<String>(rotate),
      'name': serializer.toJson<String>(name),
      'strain': serializer.toJson<String>(strain),
      'dropboxToken': serializer.toJson<String>(dropboxToken),
      'uploadName': serializer.toJson<String>(uploadName),
      'serverID': serializer.toJson<String>(serverID),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  @override
  TimelapsesCompanion createCompanion(bool nullToAbsent) {
    return TimelapsesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      plant:
          plant == null && nullToAbsent ? const Value.absent() : Value(plant),
      ssid: ssid == null && nullToAbsent ? const Value.absent() : Value(ssid),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      controllerID: controllerID == null && nullToAbsent
          ? const Value.absent()
          : Value(controllerID),
      rotate:
          rotate == null && nullToAbsent ? const Value.absent() : Value(rotate),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      strain:
          strain == null && nullToAbsent ? const Value.absent() : Value(strain),
      dropboxToken: dropboxToken == null && nullToAbsent
          ? const Value.absent()
          : Value(dropboxToken),
      uploadName: uploadName == null && nullToAbsent
          ? const Value.absent()
          : Value(uploadName),
      serverID: serverID == null && nullToAbsent
          ? const Value.absent()
          : Value(serverID),
      synced:
          synced == null && nullToAbsent ? const Value.absent() : Value(synced),
    );
  }

  Timelapse copyWith(
          {int id,
          int plant,
          String ssid,
          String password,
          String controllerID,
          String rotate,
          String name,
          String strain,
          String dropboxToken,
          String uploadName,
          String serverID,
          bool synced}) =>
      Timelapse(
        id: id ?? this.id,
        plant: plant ?? this.plant,
        ssid: ssid ?? this.ssid,
        password: password ?? this.password,
        controllerID: controllerID ?? this.controllerID,
        rotate: rotate ?? this.rotate,
        name: name ?? this.name,
        strain: strain ?? this.strain,
        dropboxToken: dropboxToken ?? this.dropboxToken,
        uploadName: uploadName ?? this.uploadName,
        serverID: serverID ?? this.serverID,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('Timelapse(')
          ..write('id: $id, ')
          ..write('plant: $plant, ')
          ..write('ssid: $ssid, ')
          ..write('password: $password, ')
          ..write('controllerID: $controllerID, ')
          ..write('rotate: $rotate, ')
          ..write('name: $name, ')
          ..write('strain: $strain, ')
          ..write('dropboxToken: $dropboxToken, ')
          ..write('uploadName: $uploadName, ')
          ..write('serverID: $serverID, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          plant.hashCode,
          $mrjc(
              ssid.hashCode,
              $mrjc(
                  password.hashCode,
                  $mrjc(
                      controllerID.hashCode,
                      $mrjc(
                          rotate.hashCode,
                          $mrjc(
                              name.hashCode,
                              $mrjc(
                                  strain.hashCode,
                                  $mrjc(
                                      dropboxToken.hashCode,
                                      $mrjc(
                                          uploadName.hashCode,
                                          $mrjc(serverID.hashCode,
                                              synced.hashCode))))))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Timelapse &&
          other.id == this.id &&
          other.plant == this.plant &&
          other.ssid == this.ssid &&
          other.password == this.password &&
          other.controllerID == this.controllerID &&
          other.rotate == this.rotate &&
          other.name == this.name &&
          other.strain == this.strain &&
          other.dropboxToken == this.dropboxToken &&
          other.uploadName == this.uploadName &&
          other.serverID == this.serverID &&
          other.synced == this.synced);
}

class TimelapsesCompanion extends UpdateCompanion<Timelapse> {
  final Value<int> id;
  final Value<int> plant;
  final Value<String> ssid;
  final Value<String> password;
  final Value<String> controllerID;
  final Value<String> rotate;
  final Value<String> name;
  final Value<String> strain;
  final Value<String> dropboxToken;
  final Value<String> uploadName;
  final Value<String> serverID;
  final Value<bool> synced;
  const TimelapsesCompanion({
    this.id = const Value.absent(),
    this.plant = const Value.absent(),
    this.ssid = const Value.absent(),
    this.password = const Value.absent(),
    this.controllerID = const Value.absent(),
    this.rotate = const Value.absent(),
    this.name = const Value.absent(),
    this.strain = const Value.absent(),
    this.dropboxToken = const Value.absent(),
    this.uploadName = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  });
  TimelapsesCompanion.insert({
    this.id = const Value.absent(),
    @required int plant,
    this.ssid = const Value.absent(),
    this.password = const Value.absent(),
    this.controllerID = const Value.absent(),
    this.rotate = const Value.absent(),
    this.name = const Value.absent(),
    this.strain = const Value.absent(),
    this.dropboxToken = const Value.absent(),
    this.uploadName = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  }) : plant = Value(plant);
  TimelapsesCompanion copyWith(
      {Value<int> id,
      Value<int> plant,
      Value<String> ssid,
      Value<String> password,
      Value<String> controllerID,
      Value<String> rotate,
      Value<String> name,
      Value<String> strain,
      Value<String> dropboxToken,
      Value<String> uploadName,
      Value<String> serverID,
      Value<bool> synced}) {
    return TimelapsesCompanion(
      id: id ?? this.id,
      plant: plant ?? this.plant,
      ssid: ssid ?? this.ssid,
      password: password ?? this.password,
      controllerID: controllerID ?? this.controllerID,
      rotate: rotate ?? this.rotate,
      name: name ?? this.name,
      strain: strain ?? this.strain,
      dropboxToken: dropboxToken ?? this.dropboxToken,
      uploadName: uploadName ?? this.uploadName,
      serverID: serverID ?? this.serverID,
      synced: synced ?? this.synced,
    );
  }
}

class $TimelapsesTable extends Timelapses
    with TableInfo<$TimelapsesTable, Timelapse> {
  final GeneratedDatabase _db;
  final String _alias;
  $TimelapsesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _plantMeta = const VerificationMeta('plant');
  GeneratedIntColumn _plant;
  @override
  GeneratedIntColumn get plant => _plant ??= _constructPlant();
  GeneratedIntColumn _constructPlant() {
    return GeneratedIntColumn(
      'plant',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ssidMeta = const VerificationMeta('ssid');
  GeneratedTextColumn _ssid;
  @override
  GeneratedTextColumn get ssid => _ssid ??= _constructSsid();
  GeneratedTextColumn _constructSsid() {
    return GeneratedTextColumn('ssid', $tableName, true,
        minTextLength: 1, maxTextLength: 64);
  }

  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  GeneratedTextColumn _password;
  @override
  GeneratedTextColumn get password => _password ??= _constructPassword();
  GeneratedTextColumn _constructPassword() {
    return GeneratedTextColumn('password', $tableName, true,
        minTextLength: 1, maxTextLength: 64);
  }

  final VerificationMeta _controllerIDMeta =
      const VerificationMeta('controllerID');
  GeneratedTextColumn _controllerID;
  @override
  GeneratedTextColumn get controllerID =>
      _controllerID ??= _constructControllerID();
  GeneratedTextColumn _constructControllerID() {
    return GeneratedTextColumn('controller_i_d', $tableName, true,
        minTextLength: 1, maxTextLength: 64);
  }

  final VerificationMeta _rotateMeta = const VerificationMeta('rotate');
  GeneratedTextColumn _rotate;
  @override
  GeneratedTextColumn get rotate => _rotate ??= _constructRotate();
  GeneratedTextColumn _constructRotate() {
    return GeneratedTextColumn('rotate', $tableName, true,
        minTextLength: 1, maxTextLength: 64);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, true,
        minTextLength: 1, maxTextLength: 64);
  }

  final VerificationMeta _strainMeta = const VerificationMeta('strain');
  GeneratedTextColumn _strain;
  @override
  GeneratedTextColumn get strain => _strain ??= _constructStrain();
  GeneratedTextColumn _constructStrain() {
    return GeneratedTextColumn('strain', $tableName, true,
        minTextLength: 1, maxTextLength: 64);
  }

  final VerificationMeta _dropboxTokenMeta =
      const VerificationMeta('dropboxToken');
  GeneratedTextColumn _dropboxToken;
  @override
  GeneratedTextColumn get dropboxToken =>
      _dropboxToken ??= _constructDropboxToken();
  GeneratedTextColumn _constructDropboxToken() {
    return GeneratedTextColumn('dropbox_token', $tableName, true,
        minTextLength: 1, maxTextLength: 64);
  }

  final VerificationMeta _uploadNameMeta = const VerificationMeta('uploadName');
  GeneratedTextColumn _uploadName;
  @override
  GeneratedTextColumn get uploadName => _uploadName ??= _constructUploadName();
  GeneratedTextColumn _constructUploadName() {
    return GeneratedTextColumn('upload_name', $tableName, true,
        minTextLength: 1, maxTextLength: 64);
  }

  final VerificationMeta _serverIDMeta = const VerificationMeta('serverID');
  GeneratedTextColumn _serverID;
  @override
  GeneratedTextColumn get serverID => _serverID ??= _constructServerID();
  GeneratedTextColumn _constructServerID() {
    return GeneratedTextColumn('server_i_d', $tableName, true,
        minTextLength: 36, maxTextLength: 36);
  }

  final VerificationMeta _syncedMeta = const VerificationMeta('synced');
  GeneratedBoolColumn _synced;
  @override
  GeneratedBoolColumn get synced => _synced ??= _constructSynced();
  GeneratedBoolColumn _constructSynced() {
    return GeneratedBoolColumn('synced', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        plant,
        ssid,
        password,
        controllerID,
        rotate,
        name,
        strain,
        dropboxToken,
        uploadName,
        serverID,
        synced
      ];
  @override
  $TimelapsesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'timelapses';
  @override
  final String actualTableName = 'timelapses';
  @override
  VerificationContext validateIntegrity(TimelapsesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.plant.present) {
      context.handle(
          _plantMeta, plant.isAcceptableValue(d.plant.value, _plantMeta));
    } else if (plant.isRequired && isInserting) {
      context.missing(_plantMeta);
    }
    if (d.ssid.present) {
      context.handle(
          _ssidMeta, ssid.isAcceptableValue(d.ssid.value, _ssidMeta));
    } else if (ssid.isRequired && isInserting) {
      context.missing(_ssidMeta);
    }
    if (d.password.present) {
      context.handle(_passwordMeta,
          password.isAcceptableValue(d.password.value, _passwordMeta));
    } else if (password.isRequired && isInserting) {
      context.missing(_passwordMeta);
    }
    if (d.controllerID.present) {
      context.handle(
          _controllerIDMeta,
          controllerID.isAcceptableValue(
              d.controllerID.value, _controllerIDMeta));
    } else if (controllerID.isRequired && isInserting) {
      context.missing(_controllerIDMeta);
    }
    if (d.rotate.present) {
      context.handle(
          _rotateMeta, rotate.isAcceptableValue(d.rotate.value, _rotateMeta));
    } else if (rotate.isRequired && isInserting) {
      context.missing(_rotateMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.strain.present) {
      context.handle(
          _strainMeta, strain.isAcceptableValue(d.strain.value, _strainMeta));
    } else if (strain.isRequired && isInserting) {
      context.missing(_strainMeta);
    }
    if (d.dropboxToken.present) {
      context.handle(
          _dropboxTokenMeta,
          dropboxToken.isAcceptableValue(
              d.dropboxToken.value, _dropboxTokenMeta));
    } else if (dropboxToken.isRequired && isInserting) {
      context.missing(_dropboxTokenMeta);
    }
    if (d.uploadName.present) {
      context.handle(_uploadNameMeta,
          uploadName.isAcceptableValue(d.uploadName.value, _uploadNameMeta));
    } else if (uploadName.isRequired && isInserting) {
      context.missing(_uploadNameMeta);
    }
    if (d.serverID.present) {
      context.handle(_serverIDMeta,
          serverID.isAcceptableValue(d.serverID.value, _serverIDMeta));
    } else if (serverID.isRequired && isInserting) {
      context.missing(_serverIDMeta);
    }
    if (d.synced.present) {
      context.handle(
          _syncedMeta, synced.isAcceptableValue(d.synced.value, _syncedMeta));
    } else if (synced.isRequired && isInserting) {
      context.missing(_syncedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Timelapse map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Timelapse.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TimelapsesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.plant.present) {
      map['plant'] = Variable<int, IntType>(d.plant.value);
    }
    if (d.ssid.present) {
      map['ssid'] = Variable<String, StringType>(d.ssid.value);
    }
    if (d.password.present) {
      map['password'] = Variable<String, StringType>(d.password.value);
    }
    if (d.controllerID.present) {
      map['controller_i_d'] =
          Variable<String, StringType>(d.controllerID.value);
    }
    if (d.rotate.present) {
      map['rotate'] = Variable<String, StringType>(d.rotate.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.strain.present) {
      map['strain'] = Variable<String, StringType>(d.strain.value);
    }
    if (d.dropboxToken.present) {
      map['dropbox_token'] = Variable<String, StringType>(d.dropboxToken.value);
    }
    if (d.uploadName.present) {
      map['upload_name'] = Variable<String, StringType>(d.uploadName.value);
    }
    if (d.serverID.present) {
      map['server_i_d'] = Variable<String, StringType>(d.serverID.value);
    }
    if (d.synced.present) {
      map['synced'] = Variable<bool, BoolType>(d.synced.value);
    }
    return map;
  }

  @override
  $TimelapsesTable createAlias(String alias) {
    return $TimelapsesTable(_db, alias);
  }
}

class Feed extends DataClass implements Insertable<Feed> {
  final int id;
  final String name;
  final bool isNewsFeed;
  final String serverID;
  final bool synced;
  Feed(
      {@required this.id,
      @required this.name,
      @required this.isNewsFeed,
      this.serverID,
      @required this.synced});
  factory Feed.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Feed(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      isNewsFeed: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_news_feed']),
      serverID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}server_i_d']),
      synced:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}synced']),
    );
  }
  factory Feed.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Feed(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isNewsFeed: serializer.fromJson<bool>(json['isNewsFeed']),
      serverID: serializer.fromJson<String>(json['serverID']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isNewsFeed': serializer.toJson<bool>(isNewsFeed),
      'serverID': serializer.toJson<String>(serverID),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  @override
  FeedsCompanion createCompanion(bool nullToAbsent) {
    return FeedsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      isNewsFeed: isNewsFeed == null && nullToAbsent
          ? const Value.absent()
          : Value(isNewsFeed),
      serverID: serverID == null && nullToAbsent
          ? const Value.absent()
          : Value(serverID),
      synced:
          synced == null && nullToAbsent ? const Value.absent() : Value(synced),
    );
  }

  Feed copyWith(
          {int id,
          String name,
          bool isNewsFeed,
          String serverID,
          bool synced}) =>
      Feed(
        id: id ?? this.id,
        name: name ?? this.name,
        isNewsFeed: isNewsFeed ?? this.isNewsFeed,
        serverID: serverID ?? this.serverID,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('Feed(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isNewsFeed: $isNewsFeed, ')
          ..write('serverID: $serverID, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(isNewsFeed.hashCode,
              $mrjc(serverID.hashCode, synced.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Feed &&
          other.id == this.id &&
          other.name == this.name &&
          other.isNewsFeed == this.isNewsFeed &&
          other.serverID == this.serverID &&
          other.synced == this.synced);
}

class FeedsCompanion extends UpdateCompanion<Feed> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isNewsFeed;
  final Value<String> serverID;
  final Value<bool> synced;
  const FeedsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isNewsFeed = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  });
  FeedsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.isNewsFeed = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  }) : name = Value(name);
  FeedsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<bool> isNewsFeed,
      Value<String> serverID,
      Value<bool> synced}) {
    return FeedsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isNewsFeed: isNewsFeed ?? this.isNewsFeed,
      serverID: serverID ?? this.serverID,
      synced: synced ?? this.synced,
    );
  }
}

class $FeedsTable extends Feeds with TableInfo<$FeedsTable, Feed> {
  final GeneratedDatabase _db;
  final String _alias;
  $FeedsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 1, maxTextLength: 24);
  }

  final VerificationMeta _isNewsFeedMeta = const VerificationMeta('isNewsFeed');
  GeneratedBoolColumn _isNewsFeed;
  @override
  GeneratedBoolColumn get isNewsFeed => _isNewsFeed ??= _constructIsNewsFeed();
  GeneratedBoolColumn _constructIsNewsFeed() {
    return GeneratedBoolColumn('is_news_feed', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _serverIDMeta = const VerificationMeta('serverID');
  GeneratedTextColumn _serverID;
  @override
  GeneratedTextColumn get serverID => _serverID ??= _constructServerID();
  GeneratedTextColumn _constructServerID() {
    return GeneratedTextColumn('server_i_d', $tableName, true,
        minTextLength: 36, maxTextLength: 36);
  }

  final VerificationMeta _syncedMeta = const VerificationMeta('synced');
  GeneratedBoolColumn _synced;
  @override
  GeneratedBoolColumn get synced => _synced ??= _constructSynced();
  GeneratedBoolColumn _constructSynced() {
    return GeneratedBoolColumn('synced', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, isNewsFeed, serverID, synced];
  @override
  $FeedsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'feeds';
  @override
  final String actualTableName = 'feeds';
  @override
  VerificationContext validateIntegrity(FeedsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.isNewsFeed.present) {
      context.handle(_isNewsFeedMeta,
          isNewsFeed.isAcceptableValue(d.isNewsFeed.value, _isNewsFeedMeta));
    } else if (isNewsFeed.isRequired && isInserting) {
      context.missing(_isNewsFeedMeta);
    }
    if (d.serverID.present) {
      context.handle(_serverIDMeta,
          serverID.isAcceptableValue(d.serverID.value, _serverIDMeta));
    } else if (serverID.isRequired && isInserting) {
      context.missing(_serverIDMeta);
    }
    if (d.synced.present) {
      context.handle(
          _syncedMeta, synced.isAcceptableValue(d.synced.value, _syncedMeta));
    } else if (synced.isRequired && isInserting) {
      context.missing(_syncedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Feed map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Feed.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FeedsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.isNewsFeed.present) {
      map['is_news_feed'] = Variable<bool, BoolType>(d.isNewsFeed.value);
    }
    if (d.serverID.present) {
      map['server_i_d'] = Variable<String, StringType>(d.serverID.value);
    }
    if (d.synced.present) {
      map['synced'] = Variable<bool, BoolType>(d.synced.value);
    }
    return map;
  }

  @override
  $FeedsTable createAlias(String alias) {
    return $FeedsTable(_db, alias);
  }
}

class FeedEntry extends DataClass implements Insertable<FeedEntry> {
  final int id;
  final int feed;
  final DateTime date;
  final String type;
  final bool isNew;
  final String params;
  final String serverID;
  final bool synced;
  FeedEntry(
      {@required this.id,
      @required this.feed,
      @required this.date,
      @required this.type,
      @required this.isNew,
      @required this.params,
      this.serverID,
      @required this.synced});
  factory FeedEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return FeedEntry(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      feed: intType.mapFromDatabaseResponse(data['${effectivePrefix}feed']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      isNew: boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_new']),
      params:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}params']),
      serverID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}server_i_d']),
      synced:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}synced']),
    );
  }
  factory FeedEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return FeedEntry(
      id: serializer.fromJson<int>(json['id']),
      feed: serializer.fromJson<int>(json['feed']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
      isNew: serializer.fromJson<bool>(json['isNew']),
      params: serializer.fromJson<String>(json['params']),
      serverID: serializer.fromJson<String>(json['serverID']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'feed': serializer.toJson<int>(feed),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
      'isNew': serializer.toJson<bool>(isNew),
      'params': serializer.toJson<String>(params),
      'serverID': serializer.toJson<String>(serverID),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  @override
  FeedEntriesCompanion createCompanion(bool nullToAbsent) {
    return FeedEntriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      feed: feed == null && nullToAbsent ? const Value.absent() : Value(feed),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      isNew:
          isNew == null && nullToAbsent ? const Value.absent() : Value(isNew),
      params:
          params == null && nullToAbsent ? const Value.absent() : Value(params),
      serverID: serverID == null && nullToAbsent
          ? const Value.absent()
          : Value(serverID),
      synced:
          synced == null && nullToAbsent ? const Value.absent() : Value(synced),
    );
  }

  FeedEntry copyWith(
          {int id,
          int feed,
          DateTime date,
          String type,
          bool isNew,
          String params,
          String serverID,
          bool synced}) =>
      FeedEntry(
        id: id ?? this.id,
        feed: feed ?? this.feed,
        date: date ?? this.date,
        type: type ?? this.type,
        isNew: isNew ?? this.isNew,
        params: params ?? this.params,
        serverID: serverID ?? this.serverID,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('FeedEntry(')
          ..write('id: $id, ')
          ..write('feed: $feed, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('isNew: $isNew, ')
          ..write('params: $params, ')
          ..write('serverID: $serverID, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          feed.hashCode,
          $mrjc(
              date.hashCode,
              $mrjc(
                  type.hashCode,
                  $mrjc(
                      isNew.hashCode,
                      $mrjc(params.hashCode,
                          $mrjc(serverID.hashCode, synced.hashCode))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is FeedEntry &&
          other.id == this.id &&
          other.feed == this.feed &&
          other.date == this.date &&
          other.type == this.type &&
          other.isNew == this.isNew &&
          other.params == this.params &&
          other.serverID == this.serverID &&
          other.synced == this.synced);
}

class FeedEntriesCompanion extends UpdateCompanion<FeedEntry> {
  final Value<int> id;
  final Value<int> feed;
  final Value<DateTime> date;
  final Value<String> type;
  final Value<bool> isNew;
  final Value<String> params;
  final Value<String> serverID;
  final Value<bool> synced;
  const FeedEntriesCompanion({
    this.id = const Value.absent(),
    this.feed = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.isNew = const Value.absent(),
    this.params = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  });
  FeedEntriesCompanion.insert({
    this.id = const Value.absent(),
    @required int feed,
    @required DateTime date,
    @required String type,
    this.isNew = const Value.absent(),
    this.params = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  })  : feed = Value(feed),
        date = Value(date),
        type = Value(type);
  FeedEntriesCompanion copyWith(
      {Value<int> id,
      Value<int> feed,
      Value<DateTime> date,
      Value<String> type,
      Value<bool> isNew,
      Value<String> params,
      Value<String> serverID,
      Value<bool> synced}) {
    return FeedEntriesCompanion(
      id: id ?? this.id,
      feed: feed ?? this.feed,
      date: date ?? this.date,
      type: type ?? this.type,
      isNew: isNew ?? this.isNew,
      params: params ?? this.params,
      serverID: serverID ?? this.serverID,
      synced: synced ?? this.synced,
    );
  }
}

class $FeedEntriesTable extends FeedEntries
    with TableInfo<$FeedEntriesTable, FeedEntry> {
  final GeneratedDatabase _db;
  final String _alias;
  $FeedEntriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _feedMeta = const VerificationMeta('feed');
  GeneratedIntColumn _feed;
  @override
  GeneratedIntColumn get feed => _feed ??= _constructFeed();
  GeneratedIntColumn _constructFeed() {
    return GeneratedIntColumn(
      'feed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, false,
        minTextLength: 1, maxTextLength: 24);
  }

  final VerificationMeta _isNewMeta = const VerificationMeta('isNew');
  GeneratedBoolColumn _isNew;
  @override
  GeneratedBoolColumn get isNew => _isNew ??= _constructIsNew();
  GeneratedBoolColumn _constructIsNew() {
    return GeneratedBoolColumn('is_new', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _paramsMeta = const VerificationMeta('params');
  GeneratedTextColumn _params;
  @override
  GeneratedTextColumn get params => _params ??= _constructParams();
  GeneratedTextColumn _constructParams() {
    return GeneratedTextColumn('params', $tableName, false,
        defaultValue: Constant('{}'));
  }

  final VerificationMeta _serverIDMeta = const VerificationMeta('serverID');
  GeneratedTextColumn _serverID;
  @override
  GeneratedTextColumn get serverID => _serverID ??= _constructServerID();
  GeneratedTextColumn _constructServerID() {
    return GeneratedTextColumn('server_i_d', $tableName, true,
        minTextLength: 36, maxTextLength: 36);
  }

  final VerificationMeta _syncedMeta = const VerificationMeta('synced');
  GeneratedBoolColumn _synced;
  @override
  GeneratedBoolColumn get synced => _synced ??= _constructSynced();
  GeneratedBoolColumn _constructSynced() {
    return GeneratedBoolColumn('synced', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, feed, date, type, isNew, params, serverID, synced];
  @override
  $FeedEntriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'feed_entries';
  @override
  final String actualTableName = 'feed_entries';
  @override
  VerificationContext validateIntegrity(FeedEntriesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.feed.present) {
      context.handle(
          _feedMeta, feed.isAcceptableValue(d.feed.value, _feedMeta));
    } else if (feed.isRequired && isInserting) {
      context.missing(_feedMeta);
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (date.isRequired && isInserting) {
      context.missing(_dateMeta);
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    } else if (type.isRequired && isInserting) {
      context.missing(_typeMeta);
    }
    if (d.isNew.present) {
      context.handle(
          _isNewMeta, isNew.isAcceptableValue(d.isNew.value, _isNewMeta));
    } else if (isNew.isRequired && isInserting) {
      context.missing(_isNewMeta);
    }
    if (d.params.present) {
      context.handle(
          _paramsMeta, params.isAcceptableValue(d.params.value, _paramsMeta));
    } else if (params.isRequired && isInserting) {
      context.missing(_paramsMeta);
    }
    if (d.serverID.present) {
      context.handle(_serverIDMeta,
          serverID.isAcceptableValue(d.serverID.value, _serverIDMeta));
    } else if (serverID.isRequired && isInserting) {
      context.missing(_serverIDMeta);
    }
    if (d.synced.present) {
      context.handle(
          _syncedMeta, synced.isAcceptableValue(d.synced.value, _syncedMeta));
    } else if (synced.isRequired && isInserting) {
      context.missing(_syncedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedEntry map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FeedEntry.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FeedEntriesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.feed.present) {
      map['feed'] = Variable<int, IntType>(d.feed.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    if (d.isNew.present) {
      map['is_new'] = Variable<bool, BoolType>(d.isNew.value);
    }
    if (d.params.present) {
      map['params'] = Variable<String, StringType>(d.params.value);
    }
    if (d.serverID.present) {
      map['server_i_d'] = Variable<String, StringType>(d.serverID.value);
    }
    if (d.synced.present) {
      map['synced'] = Variable<bool, BoolType>(d.synced.value);
    }
    return map;
  }

  @override
  $FeedEntriesTable createAlias(String alias) {
    return $FeedEntriesTable(_db, alias);
  }
}

class FeedEntryDraft extends DataClass implements Insertable<FeedEntryDraft> {
  final int id;
  final int feed;
  final String type;
  final String params;
  FeedEntryDraft(
      {@required this.id,
      @required this.feed,
      @required this.type,
      @required this.params});
  factory FeedEntryDraft.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return FeedEntryDraft(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      feed: intType.mapFromDatabaseResponse(data['${effectivePrefix}feed']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
      params:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}params']),
    );
  }
  factory FeedEntryDraft.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return FeedEntryDraft(
      id: serializer.fromJson<int>(json['id']),
      feed: serializer.fromJson<int>(json['feed']),
      type: serializer.fromJson<String>(json['type']),
      params: serializer.fromJson<String>(json['params']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'feed': serializer.toJson<int>(feed),
      'type': serializer.toJson<String>(type),
      'params': serializer.toJson<String>(params),
    };
  }

  @override
  FeedEntryDraftsCompanion createCompanion(bool nullToAbsent) {
    return FeedEntryDraftsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      feed: feed == null && nullToAbsent ? const Value.absent() : Value(feed),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      params:
          params == null && nullToAbsent ? const Value.absent() : Value(params),
    );
  }

  FeedEntryDraft copyWith({int id, int feed, String type, String params}) =>
      FeedEntryDraft(
        id: id ?? this.id,
        feed: feed ?? this.feed,
        type: type ?? this.type,
        params: params ?? this.params,
      );
  @override
  String toString() {
    return (StringBuffer('FeedEntryDraft(')
          ..write('id: $id, ')
          ..write('feed: $feed, ')
          ..write('type: $type, ')
          ..write('params: $params')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(feed.hashCode, $mrjc(type.hashCode, params.hashCode))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is FeedEntryDraft &&
          other.id == this.id &&
          other.feed == this.feed &&
          other.type == this.type &&
          other.params == this.params);
}

class FeedEntryDraftsCompanion extends UpdateCompanion<FeedEntryDraft> {
  final Value<int> id;
  final Value<int> feed;
  final Value<String> type;
  final Value<String> params;
  const FeedEntryDraftsCompanion({
    this.id = const Value.absent(),
    this.feed = const Value.absent(),
    this.type = const Value.absent(),
    this.params = const Value.absent(),
  });
  FeedEntryDraftsCompanion.insert({
    this.id = const Value.absent(),
    @required int feed,
    @required String type,
    this.params = const Value.absent(),
  })  : feed = Value(feed),
        type = Value(type);
  FeedEntryDraftsCompanion copyWith(
      {Value<int> id,
      Value<int> feed,
      Value<String> type,
      Value<String> params}) {
    return FeedEntryDraftsCompanion(
      id: id ?? this.id,
      feed: feed ?? this.feed,
      type: type ?? this.type,
      params: params ?? this.params,
    );
  }
}

class $FeedEntryDraftsTable extends FeedEntryDrafts
    with TableInfo<$FeedEntryDraftsTable, FeedEntryDraft> {
  final GeneratedDatabase _db;
  final String _alias;
  $FeedEntryDraftsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _feedMeta = const VerificationMeta('feed');
  GeneratedIntColumn _feed;
  @override
  GeneratedIntColumn get feed => _feed ??= _constructFeed();
  GeneratedIntColumn _constructFeed() {
    return GeneratedIntColumn(
      'feed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, false,
        minTextLength: 1, maxTextLength: 24);
  }

  final VerificationMeta _paramsMeta = const VerificationMeta('params');
  GeneratedTextColumn _params;
  @override
  GeneratedTextColumn get params => _params ??= _constructParams();
  GeneratedTextColumn _constructParams() {
    return GeneratedTextColumn('params', $tableName, false,
        defaultValue: Constant('{}'));
  }

  @override
  List<GeneratedColumn> get $columns => [id, feed, type, params];
  @override
  $FeedEntryDraftsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'feed_entry_drafts';
  @override
  final String actualTableName = 'feed_entry_drafts';
  @override
  VerificationContext validateIntegrity(FeedEntryDraftsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.feed.present) {
      context.handle(
          _feedMeta, feed.isAcceptableValue(d.feed.value, _feedMeta));
    } else if (feed.isRequired && isInserting) {
      context.missing(_feedMeta);
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    } else if (type.isRequired && isInserting) {
      context.missing(_typeMeta);
    }
    if (d.params.present) {
      context.handle(
          _paramsMeta, params.isAcceptableValue(d.params.value, _paramsMeta));
    } else if (params.isRequired && isInserting) {
      context.missing(_paramsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedEntryDraft map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FeedEntryDraft.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FeedEntryDraftsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.feed.present) {
      map['feed'] = Variable<int, IntType>(d.feed.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    if (d.params.present) {
      map['params'] = Variable<String, StringType>(d.params.value);
    }
    return map;
  }

  @override
  $FeedEntryDraftsTable createAlias(String alias) {
    return $FeedEntryDraftsTable(_db, alias);
  }
}

class FeedMedia extends DataClass implements Insertable<FeedMedia> {
  final int id;
  final int feed;
  final int feedEntry;
  final String filePath;
  final String thumbnailPath;
  final String params;
  final String serverID;
  final bool synced;
  FeedMedia(
      {@required this.id,
      @required this.feed,
      @required this.feedEntry,
      @required this.filePath,
      @required this.thumbnailPath,
      @required this.params,
      this.serverID,
      @required this.synced});
  factory FeedMedia.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return FeedMedia(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      feed: intType.mapFromDatabaseResponse(data['${effectivePrefix}feed']),
      feedEntry:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}feed_entry']),
      filePath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}file_path']),
      thumbnailPath: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail_path']),
      params:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}params']),
      serverID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}server_i_d']),
      synced:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}synced']),
    );
  }
  factory FeedMedia.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return FeedMedia(
      id: serializer.fromJson<int>(json['id']),
      feed: serializer.fromJson<int>(json['feed']),
      feedEntry: serializer.fromJson<int>(json['feedEntry']),
      filePath: serializer.fromJson<String>(json['filePath']),
      thumbnailPath: serializer.fromJson<String>(json['thumbnailPath']),
      params: serializer.fromJson<String>(json['params']),
      serverID: serializer.fromJson<String>(json['serverID']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'feed': serializer.toJson<int>(feed),
      'feedEntry': serializer.toJson<int>(feedEntry),
      'filePath': serializer.toJson<String>(filePath),
      'thumbnailPath': serializer.toJson<String>(thumbnailPath),
      'params': serializer.toJson<String>(params),
      'serverID': serializer.toJson<String>(serverID),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  @override
  FeedMediasCompanion createCompanion(bool nullToAbsent) {
    return FeedMediasCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      feed: feed == null && nullToAbsent ? const Value.absent() : Value(feed),
      feedEntry: feedEntry == null && nullToAbsent
          ? const Value.absent()
          : Value(feedEntry),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      thumbnailPath: thumbnailPath == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailPath),
      params:
          params == null && nullToAbsent ? const Value.absent() : Value(params),
      serverID: serverID == null && nullToAbsent
          ? const Value.absent()
          : Value(serverID),
      synced:
          synced == null && nullToAbsent ? const Value.absent() : Value(synced),
    );
  }

  FeedMedia copyWith(
          {int id,
          int feed,
          int feedEntry,
          String filePath,
          String thumbnailPath,
          String params,
          String serverID,
          bool synced}) =>
      FeedMedia(
        id: id ?? this.id,
        feed: feed ?? this.feed,
        feedEntry: feedEntry ?? this.feedEntry,
        filePath: filePath ?? this.filePath,
        thumbnailPath: thumbnailPath ?? this.thumbnailPath,
        params: params ?? this.params,
        serverID: serverID ?? this.serverID,
        synced: synced ?? this.synced,
      );
  @override
  String toString() {
    return (StringBuffer('FeedMedia(')
          ..write('id: $id, ')
          ..write('feed: $feed, ')
          ..write('feedEntry: $feedEntry, ')
          ..write('filePath: $filePath, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('params: $params, ')
          ..write('serverID: $serverID, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          feed.hashCode,
          $mrjc(
              feedEntry.hashCode,
              $mrjc(
                  filePath.hashCode,
                  $mrjc(
                      thumbnailPath.hashCode,
                      $mrjc(params.hashCode,
                          $mrjc(serverID.hashCode, synced.hashCode))))))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is FeedMedia &&
          other.id == this.id &&
          other.feed == this.feed &&
          other.feedEntry == this.feedEntry &&
          other.filePath == this.filePath &&
          other.thumbnailPath == this.thumbnailPath &&
          other.params == this.params &&
          other.serverID == this.serverID &&
          other.synced == this.synced);
}

class FeedMediasCompanion extends UpdateCompanion<FeedMedia> {
  final Value<int> id;
  final Value<int> feed;
  final Value<int> feedEntry;
  final Value<String> filePath;
  final Value<String> thumbnailPath;
  final Value<String> params;
  final Value<String> serverID;
  final Value<bool> synced;
  const FeedMediasCompanion({
    this.id = const Value.absent(),
    this.feed = const Value.absent(),
    this.feedEntry = const Value.absent(),
    this.filePath = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.params = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  });
  FeedMediasCompanion.insert({
    this.id = const Value.absent(),
    @required int feed,
    @required int feedEntry,
    @required String filePath,
    @required String thumbnailPath,
    this.params = const Value.absent(),
    this.serverID = const Value.absent(),
    this.synced = const Value.absent(),
  })  : feed = Value(feed),
        feedEntry = Value(feedEntry),
        filePath = Value(filePath),
        thumbnailPath = Value(thumbnailPath);
  FeedMediasCompanion copyWith(
      {Value<int> id,
      Value<int> feed,
      Value<int> feedEntry,
      Value<String> filePath,
      Value<String> thumbnailPath,
      Value<String> params,
      Value<String> serverID,
      Value<bool> synced}) {
    return FeedMediasCompanion(
      id: id ?? this.id,
      feed: feed ?? this.feed,
      feedEntry: feedEntry ?? this.feedEntry,
      filePath: filePath ?? this.filePath,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      params: params ?? this.params,
      serverID: serverID ?? this.serverID,
      synced: synced ?? this.synced,
    );
  }
}

class $FeedMediasTable extends FeedMedias
    with TableInfo<$FeedMediasTable, FeedMedia> {
  final GeneratedDatabase _db;
  final String _alias;
  $FeedMediasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _feedMeta = const VerificationMeta('feed');
  GeneratedIntColumn _feed;
  @override
  GeneratedIntColumn get feed => _feed ??= _constructFeed();
  GeneratedIntColumn _constructFeed() {
    return GeneratedIntColumn(
      'feed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _feedEntryMeta = const VerificationMeta('feedEntry');
  GeneratedIntColumn _feedEntry;
  @override
  GeneratedIntColumn get feedEntry => _feedEntry ??= _constructFeedEntry();
  GeneratedIntColumn _constructFeedEntry() {
    return GeneratedIntColumn(
      'feed_entry',
      $tableName,
      false,
    );
  }

  final VerificationMeta _filePathMeta = const VerificationMeta('filePath');
  GeneratedTextColumn _filePath;
  @override
  GeneratedTextColumn get filePath => _filePath ??= _constructFilePath();
  GeneratedTextColumn _constructFilePath() {
    return GeneratedTextColumn(
      'file_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _thumbnailPathMeta =
      const VerificationMeta('thumbnailPath');
  GeneratedTextColumn _thumbnailPath;
  @override
  GeneratedTextColumn get thumbnailPath =>
      _thumbnailPath ??= _constructThumbnailPath();
  GeneratedTextColumn _constructThumbnailPath() {
    return GeneratedTextColumn(
      'thumbnail_path',
      $tableName,
      false,
    );
  }

  final VerificationMeta _paramsMeta = const VerificationMeta('params');
  GeneratedTextColumn _params;
  @override
  GeneratedTextColumn get params => _params ??= _constructParams();
  GeneratedTextColumn _constructParams() {
    return GeneratedTextColumn('params', $tableName, false,
        defaultValue: Constant('{}'));
  }

  final VerificationMeta _serverIDMeta = const VerificationMeta('serverID');
  GeneratedTextColumn _serverID;
  @override
  GeneratedTextColumn get serverID => _serverID ??= _constructServerID();
  GeneratedTextColumn _constructServerID() {
    return GeneratedTextColumn('server_i_d', $tableName, true,
        minTextLength: 36, maxTextLength: 36);
  }

  final VerificationMeta _syncedMeta = const VerificationMeta('synced');
  GeneratedBoolColumn _synced;
  @override
  GeneratedBoolColumn get synced => _synced ??= _constructSynced();
  GeneratedBoolColumn _constructSynced() {
    return GeneratedBoolColumn('synced', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, feed, feedEntry, filePath, thumbnailPath, params, serverID, synced];
  @override
  $FeedMediasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'feed_medias';
  @override
  final String actualTableName = 'feed_medias';
  @override
  VerificationContext validateIntegrity(FeedMediasCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.feed.present) {
      context.handle(
          _feedMeta, feed.isAcceptableValue(d.feed.value, _feedMeta));
    } else if (feed.isRequired && isInserting) {
      context.missing(_feedMeta);
    }
    if (d.feedEntry.present) {
      context.handle(_feedEntryMeta,
          feedEntry.isAcceptableValue(d.feedEntry.value, _feedEntryMeta));
    } else if (feedEntry.isRequired && isInserting) {
      context.missing(_feedEntryMeta);
    }
    if (d.filePath.present) {
      context.handle(_filePathMeta,
          filePath.isAcceptableValue(d.filePath.value, _filePathMeta));
    } else if (filePath.isRequired && isInserting) {
      context.missing(_filePathMeta);
    }
    if (d.thumbnailPath.present) {
      context.handle(
          _thumbnailPathMeta,
          thumbnailPath.isAcceptableValue(
              d.thumbnailPath.value, _thumbnailPathMeta));
    } else if (thumbnailPath.isRequired && isInserting) {
      context.missing(_thumbnailPathMeta);
    }
    if (d.params.present) {
      context.handle(
          _paramsMeta, params.isAcceptableValue(d.params.value, _paramsMeta));
    } else if (params.isRequired && isInserting) {
      context.missing(_paramsMeta);
    }
    if (d.serverID.present) {
      context.handle(_serverIDMeta,
          serverID.isAcceptableValue(d.serverID.value, _serverIDMeta));
    } else if (serverID.isRequired && isInserting) {
      context.missing(_serverIDMeta);
    }
    if (d.synced.present) {
      context.handle(
          _syncedMeta, synced.isAcceptableValue(d.synced.value, _syncedMeta));
    } else if (synced.isRequired && isInserting) {
      context.missing(_syncedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedMedia map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FeedMedia.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FeedMediasCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.feed.present) {
      map['feed'] = Variable<int, IntType>(d.feed.value);
    }
    if (d.feedEntry.present) {
      map['feed_entry'] = Variable<int, IntType>(d.feedEntry.value);
    }
    if (d.filePath.present) {
      map['file_path'] = Variable<String, StringType>(d.filePath.value);
    }
    if (d.thumbnailPath.present) {
      map['thumbnail_path'] =
          Variable<String, StringType>(d.thumbnailPath.value);
    }
    if (d.params.present) {
      map['params'] = Variable<String, StringType>(d.params.value);
    }
    if (d.serverID.present) {
      map['server_i_d'] = Variable<String, StringType>(d.serverID.value);
    }
    if (d.synced.present) {
      map['synced'] = Variable<bool, BoolType>(d.synced.value);
    }
    return map;
  }

  @override
  $FeedMediasTable createAlias(String alias) {
    return $FeedMediasTable(_db, alias);
  }
}

class Delete extends DataClass implements Insertable<Delete> {
  final int id;
  final String serverID;
  final String type;
  Delete({@required this.id, @required this.serverID, @required this.type});
  factory Delete.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Delete(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      serverID: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}server_i_d']),
      type: stringType.mapFromDatabaseResponse(data['${effectivePrefix}type']),
    );
  }
  factory Delete.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Delete(
      id: serializer.fromJson<int>(json['id']),
      serverID: serializer.fromJson<String>(json['serverID']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'serverID': serializer.toJson<String>(serverID),
      'type': serializer.toJson<String>(type),
    };
  }

  @override
  DeletesCompanion createCompanion(bool nullToAbsent) {
    return DeletesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      serverID: serverID == null && nullToAbsent
          ? const Value.absent()
          : Value(serverID),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  Delete copyWith({int id, String serverID, String type}) => Delete(
        id: id ?? this.id,
        serverID: serverID ?? this.serverID,
        type: type ?? this.type,
      );
  @override
  String toString() {
    return (StringBuffer('Delete(')
          ..write('id: $id, ')
          ..write('serverID: $serverID, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(serverID.hashCode, type.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Delete &&
          other.id == this.id &&
          other.serverID == this.serverID &&
          other.type == this.type);
}

class DeletesCompanion extends UpdateCompanion<Delete> {
  final Value<int> id;
  final Value<String> serverID;
  final Value<String> type;
  const DeletesCompanion({
    this.id = const Value.absent(),
    this.serverID = const Value.absent(),
    this.type = const Value.absent(),
  });
  DeletesCompanion.insert({
    this.id = const Value.absent(),
    @required String serverID,
    @required String type,
  })  : serverID = Value(serverID),
        type = Value(type);
  DeletesCompanion copyWith(
      {Value<int> id, Value<String> serverID, Value<String> type}) {
    return DeletesCompanion(
      id: id ?? this.id,
      serverID: serverID ?? this.serverID,
      type: type ?? this.type,
    );
  }
}

class $DeletesTable extends Deletes with TableInfo<$DeletesTable, Delete> {
  final GeneratedDatabase _db;
  final String _alias;
  $DeletesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _serverIDMeta = const VerificationMeta('serverID');
  GeneratedTextColumn _serverID;
  @override
  GeneratedTextColumn get serverID => _serverID ??= _constructServerID();
  GeneratedTextColumn _constructServerID() {
    return GeneratedTextColumn('server_i_d', $tableName, false,
        minTextLength: 36, maxTextLength: 36);
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedTextColumn _type;
  @override
  GeneratedTextColumn get type => _type ??= _constructType();
  GeneratedTextColumn _constructType() {
    return GeneratedTextColumn('type', $tableName, false,
        minTextLength: 1, maxTextLength: 16);
  }

  @override
  List<GeneratedColumn> get $columns => [id, serverID, type];
  @override
  $DeletesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'deletes';
  @override
  final String actualTableName = 'deletes';
  @override
  VerificationContext validateIntegrity(DeletesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.serverID.present) {
      context.handle(_serverIDMeta,
          serverID.isAcceptableValue(d.serverID.value, _serverIDMeta));
    } else if (serverID.isRequired && isInserting) {
      context.missing(_serverIDMeta);
    }
    if (d.type.present) {
      context.handle(
          _typeMeta, type.isAcceptableValue(d.type.value, _typeMeta));
    } else if (type.isRequired && isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Delete map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Delete.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(DeletesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.serverID.present) {
      map['server_i_d'] = Variable<String, StringType>(d.serverID.value);
    }
    if (d.type.present) {
      map['type'] = Variable<String, StringType>(d.type.value);
    }
    return map;
  }

  @override
  $DeletesTable createAlias(String alias) {
    return $DeletesTable(_db, alias);
  }
}

abstract class _$RelDB extends GeneratedDatabase {
  _$RelDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DevicesTable _devices;
  $DevicesTable get devices => _devices ??= $DevicesTable(this);
  $ModulesTable _modules;
  $ModulesTable get modules => _modules ??= $ModulesTable(this);
  $ParamsTable _params;
  $ParamsTable get params => _params ??= $ParamsTable(this);
  $PlantsTable _plants;
  $PlantsTable get plants => _plants ??= $PlantsTable(this);
  $BoxesTable _boxes;
  $BoxesTable get boxes => _boxes ??= $BoxesTable(this);
  $ChartCachesTable _chartCaches;
  $ChartCachesTable get chartCaches => _chartCaches ??= $ChartCachesTable(this);
  $TimelapsesTable _timelapses;
  $TimelapsesTable get timelapses => _timelapses ??= $TimelapsesTable(this);
  $FeedsTable _feeds;
  $FeedsTable get feeds => _feeds ??= $FeedsTable(this);
  $FeedEntriesTable _feedEntries;
  $FeedEntriesTable get feedEntries => _feedEntries ??= $FeedEntriesTable(this);
  $FeedEntryDraftsTable _feedEntryDrafts;
  $FeedEntryDraftsTable get feedEntryDrafts =>
      _feedEntryDrafts ??= $FeedEntryDraftsTable(this);
  $FeedMediasTable _feedMedias;
  $FeedMediasTable get feedMedias => _feedMedias ??= $FeedMediasTable(this);
  $DeletesTable _deletes;
  $DeletesTable get deletes => _deletes ??= $DeletesTable(this);
  DevicesDAO _devicesDAO;
  DevicesDAO get devicesDAO => _devicesDAO ??= DevicesDAO(this as RelDB);
  PlantsDAO _plantsDAO;
  PlantsDAO get plantsDAO => _plantsDAO ??= PlantsDAO(this as RelDB);
  FeedsDAO _feedsDAO;
  FeedsDAO get feedsDAO => _feedsDAO ??= FeedsDAO(this as RelDB);
  DeletesDAO _deletesDAO;
  DeletesDAO get deletesDAO => _deletesDAO ??= DeletesDAO(this as RelDB);
  @override
  List<TableInfo> get allTables => [
        devices,
        modules,
        params,
        plants,
        boxes,
        chartCaches,
        timelapses,
        feeds,
        feedEntries,
        feedEntryDrafts,
        feedMedias,
        deletes
      ];
}
