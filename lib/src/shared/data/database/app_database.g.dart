// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AppInstallationsTable extends AppInstallations
    with TableInfo<$AppInstallationsTable, AppInstallationRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppInstallationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _installationIdMeta = const VerificationMeta(
    'installationId',
  );
  @override
  late final GeneratedColumn<String> installationId = GeneratedColumn<String>(
    'installation_id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMicrosMeta = const VerificationMeta(
    'createdAtMicros',
  );
  @override
  late final GeneratedColumn<int> createdAtMicros = GeneratedColumn<int>(
    'created_at_micros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _onboardingCompletedMeta =
      const VerificationMeta('onboardingCompleted');
  @override
  late final GeneratedColumn<bool> onboardingCompleted = GeneratedColumn<bool>(
    'onboarding_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("onboarding_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _portfolioGenerationMeta =
      const VerificationMeta('portfolioGeneration');
  @override
  late final GeneratedColumn<int> portfolioGeneration = GeneratedColumn<int>(
    'portfolio_generation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _lastResetAtMicrosMeta = const VerificationMeta(
    'lastResetAtMicros',
  );
  @override
  late final GeneratedColumn<int> lastResetAtMicros = GeneratedColumn<int>(
    'last_reset_at_micros',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    installationId,
    createdAtMicros,
    onboardingCompleted,
    portfolioGeneration,
    lastResetAtMicros,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_installations';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppInstallationRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('installation_id')) {
      context.handle(
        _installationIdMeta,
        installationId.isAcceptableOrUnknown(
          data['installation_id']!,
          _installationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_installationIdMeta);
    }
    if (data.containsKey('created_at_micros')) {
      context.handle(
        _createdAtMicrosMeta,
        createdAtMicros.isAcceptableOrUnknown(
          data['created_at_micros']!,
          _createdAtMicrosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtMicrosMeta);
    }
    if (data.containsKey('onboarding_completed')) {
      context.handle(
        _onboardingCompletedMeta,
        onboardingCompleted.isAcceptableOrUnknown(
          data['onboarding_completed']!,
          _onboardingCompletedMeta,
        ),
      );
    }
    if (data.containsKey('portfolio_generation')) {
      context.handle(
        _portfolioGenerationMeta,
        portfolioGeneration.isAcceptableOrUnknown(
          data['portfolio_generation']!,
          _portfolioGenerationMeta,
        ),
      );
    }
    if (data.containsKey('last_reset_at_micros')) {
      context.handle(
        _lastResetAtMicrosMeta,
        lastResetAtMicros.isAcceptableOrUnknown(
          data['last_reset_at_micros']!,
          _lastResetAtMicrosMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppInstallationRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppInstallationRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      installationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}installation_id'],
      )!,
      createdAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at_micros'],
      )!,
      onboardingCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}onboarding_completed'],
      )!,
      portfolioGeneration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}portfolio_generation'],
      )!,
      lastResetAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_reset_at_micros'],
      ),
    );
  }

  @override
  $AppInstallationsTable createAlias(String alias) {
    return $AppInstallationsTable(attachedDatabase, alias);
  }

  @override
  bool get isStrict => true;
}

class AppInstallationRow extends DataClass
    implements Insertable<AppInstallationRow> {
  final int id;
  final String installationId;
  final int createdAtMicros;
  final bool onboardingCompleted;
  final int portfolioGeneration;
  final int? lastResetAtMicros;
  const AppInstallationRow({
    required this.id,
    required this.installationId,
    required this.createdAtMicros,
    required this.onboardingCompleted,
    required this.portfolioGeneration,
    this.lastResetAtMicros,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['installation_id'] = Variable<String>(installationId);
    map['created_at_micros'] = Variable<int>(createdAtMicros);
    map['onboarding_completed'] = Variable<bool>(onboardingCompleted);
    map['portfolio_generation'] = Variable<int>(portfolioGeneration);
    if (!nullToAbsent || lastResetAtMicros != null) {
      map['last_reset_at_micros'] = Variable<int>(lastResetAtMicros);
    }
    return map;
  }

  AppInstallationsCompanion toCompanion(bool nullToAbsent) {
    return AppInstallationsCompanion(
      id: Value(id),
      installationId: Value(installationId),
      createdAtMicros: Value(createdAtMicros),
      onboardingCompleted: Value(onboardingCompleted),
      portfolioGeneration: Value(portfolioGeneration),
      lastResetAtMicros: lastResetAtMicros == null && nullToAbsent
          ? const Value.absent()
          : Value(lastResetAtMicros),
    );
  }

  factory AppInstallationRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppInstallationRow(
      id: serializer.fromJson<int>(json['id']),
      installationId: serializer.fromJson<String>(json['installationId']),
      createdAtMicros: serializer.fromJson<int>(json['createdAtMicros']),
      onboardingCompleted: serializer.fromJson<bool>(
        json['onboardingCompleted'],
      ),
      portfolioGeneration: serializer.fromJson<int>(
        json['portfolioGeneration'],
      ),
      lastResetAtMicros: serializer.fromJson<int?>(json['lastResetAtMicros']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'installationId': serializer.toJson<String>(installationId),
      'createdAtMicros': serializer.toJson<int>(createdAtMicros),
      'onboardingCompleted': serializer.toJson<bool>(onboardingCompleted),
      'portfolioGeneration': serializer.toJson<int>(portfolioGeneration),
      'lastResetAtMicros': serializer.toJson<int?>(lastResetAtMicros),
    };
  }

  AppInstallationRow copyWith({
    int? id,
    String? installationId,
    int? createdAtMicros,
    bool? onboardingCompleted,
    int? portfolioGeneration,
    Value<int?> lastResetAtMicros = const Value.absent(),
  }) => AppInstallationRow(
    id: id ?? this.id,
    installationId: installationId ?? this.installationId,
    createdAtMicros: createdAtMicros ?? this.createdAtMicros,
    onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
    portfolioGeneration: portfolioGeneration ?? this.portfolioGeneration,
    lastResetAtMicros: lastResetAtMicros.present
        ? lastResetAtMicros.value
        : this.lastResetAtMicros,
  );
  AppInstallationRow copyWithCompanion(AppInstallationsCompanion data) {
    return AppInstallationRow(
      id: data.id.present ? data.id.value : this.id,
      installationId: data.installationId.present
          ? data.installationId.value
          : this.installationId,
      createdAtMicros: data.createdAtMicros.present
          ? data.createdAtMicros.value
          : this.createdAtMicros,
      onboardingCompleted: data.onboardingCompleted.present
          ? data.onboardingCompleted.value
          : this.onboardingCompleted,
      portfolioGeneration: data.portfolioGeneration.present
          ? data.portfolioGeneration.value
          : this.portfolioGeneration,
      lastResetAtMicros: data.lastResetAtMicros.present
          ? data.lastResetAtMicros.value
          : this.lastResetAtMicros,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppInstallationRow(')
          ..write('id: $id, ')
          ..write('installationId: $installationId, ')
          ..write('createdAtMicros: $createdAtMicros, ')
          ..write('onboardingCompleted: $onboardingCompleted, ')
          ..write('portfolioGeneration: $portfolioGeneration, ')
          ..write('lastResetAtMicros: $lastResetAtMicros')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    installationId,
    createdAtMicros,
    onboardingCompleted,
    portfolioGeneration,
    lastResetAtMicros,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppInstallationRow &&
          other.id == this.id &&
          other.installationId == this.installationId &&
          other.createdAtMicros == this.createdAtMicros &&
          other.onboardingCompleted == this.onboardingCompleted &&
          other.portfolioGeneration == this.portfolioGeneration &&
          other.lastResetAtMicros == this.lastResetAtMicros);
}

class AppInstallationsCompanion extends UpdateCompanion<AppInstallationRow> {
  final Value<int> id;
  final Value<String> installationId;
  final Value<int> createdAtMicros;
  final Value<bool> onboardingCompleted;
  final Value<int> portfolioGeneration;
  final Value<int?> lastResetAtMicros;
  const AppInstallationsCompanion({
    this.id = const Value.absent(),
    this.installationId = const Value.absent(),
    this.createdAtMicros = const Value.absent(),
    this.onboardingCompleted = const Value.absent(),
    this.portfolioGeneration = const Value.absent(),
    this.lastResetAtMicros = const Value.absent(),
  });
  AppInstallationsCompanion.insert({
    this.id = const Value.absent(),
    required String installationId,
    required int createdAtMicros,
    this.onboardingCompleted = const Value.absent(),
    this.portfolioGeneration = const Value.absent(),
    this.lastResetAtMicros = const Value.absent(),
  }) : installationId = Value(installationId),
       createdAtMicros = Value(createdAtMicros);
  static Insertable<AppInstallationRow> custom({
    Expression<int>? id,
    Expression<String>? installationId,
    Expression<int>? createdAtMicros,
    Expression<bool>? onboardingCompleted,
    Expression<int>? portfolioGeneration,
    Expression<int>? lastResetAtMicros,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (installationId != null) 'installation_id': installationId,
      if (createdAtMicros != null) 'created_at_micros': createdAtMicros,
      if (onboardingCompleted != null)
        'onboarding_completed': onboardingCompleted,
      if (portfolioGeneration != null)
        'portfolio_generation': portfolioGeneration,
      if (lastResetAtMicros != null) 'last_reset_at_micros': lastResetAtMicros,
    });
  }

  AppInstallationsCompanion copyWith({
    Value<int>? id,
    Value<String>? installationId,
    Value<int>? createdAtMicros,
    Value<bool>? onboardingCompleted,
    Value<int>? portfolioGeneration,
    Value<int?>? lastResetAtMicros,
  }) {
    return AppInstallationsCompanion(
      id: id ?? this.id,
      installationId: installationId ?? this.installationId,
      createdAtMicros: createdAtMicros ?? this.createdAtMicros,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
      portfolioGeneration: portfolioGeneration ?? this.portfolioGeneration,
      lastResetAtMicros: lastResetAtMicros ?? this.lastResetAtMicros,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (installationId.present) {
      map['installation_id'] = Variable<String>(installationId.value);
    }
    if (createdAtMicros.present) {
      map['created_at_micros'] = Variable<int>(createdAtMicros.value);
    }
    if (onboardingCompleted.present) {
      map['onboarding_completed'] = Variable<bool>(onboardingCompleted.value);
    }
    if (portfolioGeneration.present) {
      map['portfolio_generation'] = Variable<int>(portfolioGeneration.value);
    }
    if (lastResetAtMicros.present) {
      map['last_reset_at_micros'] = Variable<int>(lastResetAtMicros.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppInstallationsCompanion(')
          ..write('id: $id, ')
          ..write('installationId: $installationId, ')
          ..write('createdAtMicros: $createdAtMicros, ')
          ..write('onboardingCompleted: $onboardingCompleted, ')
          ..write('portfolioGeneration: $portfolioGeneration, ')
          ..write('lastResetAtMicros: $lastResetAtMicros')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSettingRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMicrosMeta = const VerificationMeta(
    'updatedAtMicros',
  );
  @override
  late final GeneratedColumn<int> updatedAtMicros = GeneratedColumn<int>(
    'updated_at_micros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAtMicros];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSettingRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at_micros')) {
      context.handle(
        _updatedAtMicrosMeta,
        updatedAtMicros.isAcceptableOrUnknown(
          data['updated_at_micros']!,
          _updatedAtMicrosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMicrosMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSettingRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at_micros'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }

  @override
  bool get isStrict => true;
}

class AppSettingRow extends DataClass implements Insertable<AppSettingRow> {
  final String key;
  final String value;
  final int updatedAtMicros;
  const AppSettingRow({
    required this.key,
    required this.value,
    required this.updatedAtMicros,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at_micros'] = Variable<int>(updatedAtMicros);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAtMicros: Value(updatedAtMicros),
    );
  }

  factory AppSettingRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAtMicros: serializer.fromJson<int>(json['updatedAtMicros']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAtMicros': serializer.toJson<int>(updatedAtMicros),
    };
  }

  AppSettingRow copyWith({String? key, String? value, int? updatedAtMicros}) =>
      AppSettingRow(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAtMicros: updatedAtMicros ?? this.updatedAtMicros,
      );
  AppSettingRow copyWithCompanion(AppSettingsCompanion data) {
    return AppSettingRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAtMicros: data.updatedAtMicros.present
          ? data.updatedAtMicros.value
          : this.updatedAtMicros,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingRow(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAtMicros: $updatedAtMicros')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAtMicros);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingRow &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAtMicros == this.updatedAtMicros);
}

class AppSettingsCompanion extends UpdateCompanion<AppSettingRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> updatedAtMicros;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAtMicros = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    required int updatedAtMicros,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value),
       updatedAtMicros = Value(updatedAtMicros);
  static Insertable<AppSettingRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? updatedAtMicros,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAtMicros != null) 'updated_at_micros': updatedAtMicros,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? updatedAtMicros,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAtMicros: updatedAtMicros ?? this.updatedAtMicros,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAtMicros.present) {
      map['updated_at_micros'] = Variable<int>(updatedAtMicros.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAtMicros: $updatedAtMicros, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JpyBalancesTable extends JpyBalances
    with TableInfo<$JpyBalancesTable, JpyBalanceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JpyBalancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String> available =
      GeneratedColumn<String>(
        'available',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 64,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(initialVirtualJpyText),
      ).withConverter<FixedDecimal>($JpyBalancesTable.$converteravailable);
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String> reserved =
      GeneratedColumn<String>(
        'reserved',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 64,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(zeroDecimalText),
      ).withConverter<FixedDecimal>($JpyBalancesTable.$converterreserved);
  static const VerificationMeta _updatedAtMicrosMeta = const VerificationMeta(
    'updatedAtMicros',
  );
  @override
  late final GeneratedColumn<int> updatedAtMicros = GeneratedColumn<int>(
    'updated_at_micros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    available,
    reserved,
    updatedAtMicros,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'jpy_balances';
  @override
  VerificationContext validateIntegrity(
    Insertable<JpyBalanceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('updated_at_micros')) {
      context.handle(
        _updatedAtMicrosMeta,
        updatedAtMicros.isAcceptableOrUnknown(
          data['updated_at_micros']!,
          _updatedAtMicrosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMicrosMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JpyBalanceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JpyBalanceRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      available: $JpyBalancesTable.$converteravailable.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}available'],
        )!,
      ),
      reserved: $JpyBalancesTable.$converterreserved.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reserved'],
        )!,
      ),
      updatedAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at_micros'],
      )!,
    );
  }

  @override
  $JpyBalancesTable createAlias(String alias) {
    return $JpyBalancesTable(attachedDatabase, alias);
  }

  static TypeConverter<FixedDecimal, String> $converteravailable =
      const FixedDecimalConverter();
  static TypeConverter<FixedDecimal, String> $converterreserved =
      const FixedDecimalConverter();
  @override
  bool get isStrict => true;
}

class JpyBalanceRow extends DataClass implements Insertable<JpyBalanceRow> {
  final int id;
  final FixedDecimal available;
  final FixedDecimal reserved;
  final int updatedAtMicros;
  const JpyBalanceRow({
    required this.id,
    required this.available,
    required this.reserved,
    required this.updatedAtMicros,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['available'] = Variable<String>(
        $JpyBalancesTable.$converteravailable.toSql(available),
      );
    }
    {
      map['reserved'] = Variable<String>(
        $JpyBalancesTable.$converterreserved.toSql(reserved),
      );
    }
    map['updated_at_micros'] = Variable<int>(updatedAtMicros);
    return map;
  }

  JpyBalancesCompanion toCompanion(bool nullToAbsent) {
    return JpyBalancesCompanion(
      id: Value(id),
      available: Value(available),
      reserved: Value(reserved),
      updatedAtMicros: Value(updatedAtMicros),
    );
  }

  factory JpyBalanceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JpyBalanceRow(
      id: serializer.fromJson<int>(json['id']),
      available: serializer.fromJson<FixedDecimal>(json['available']),
      reserved: serializer.fromJson<FixedDecimal>(json['reserved']),
      updatedAtMicros: serializer.fromJson<int>(json['updatedAtMicros']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'available': serializer.toJson<FixedDecimal>(available),
      'reserved': serializer.toJson<FixedDecimal>(reserved),
      'updatedAtMicros': serializer.toJson<int>(updatedAtMicros),
    };
  }

  JpyBalanceRow copyWith({
    int? id,
    FixedDecimal? available,
    FixedDecimal? reserved,
    int? updatedAtMicros,
  }) => JpyBalanceRow(
    id: id ?? this.id,
    available: available ?? this.available,
    reserved: reserved ?? this.reserved,
    updatedAtMicros: updatedAtMicros ?? this.updatedAtMicros,
  );
  JpyBalanceRow copyWithCompanion(JpyBalancesCompanion data) {
    return JpyBalanceRow(
      id: data.id.present ? data.id.value : this.id,
      available: data.available.present ? data.available.value : this.available,
      reserved: data.reserved.present ? data.reserved.value : this.reserved,
      updatedAtMicros: data.updatedAtMicros.present
          ? data.updatedAtMicros.value
          : this.updatedAtMicros,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JpyBalanceRow(')
          ..write('id: $id, ')
          ..write('available: $available, ')
          ..write('reserved: $reserved, ')
          ..write('updatedAtMicros: $updatedAtMicros')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, available, reserved, updatedAtMicros);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JpyBalanceRow &&
          other.id == this.id &&
          other.available == this.available &&
          other.reserved == this.reserved &&
          other.updatedAtMicros == this.updatedAtMicros);
}

class JpyBalancesCompanion extends UpdateCompanion<JpyBalanceRow> {
  final Value<int> id;
  final Value<FixedDecimal> available;
  final Value<FixedDecimal> reserved;
  final Value<int> updatedAtMicros;
  const JpyBalancesCompanion({
    this.id = const Value.absent(),
    this.available = const Value.absent(),
    this.reserved = const Value.absent(),
    this.updatedAtMicros = const Value.absent(),
  });
  JpyBalancesCompanion.insert({
    this.id = const Value.absent(),
    this.available = const Value.absent(),
    this.reserved = const Value.absent(),
    required int updatedAtMicros,
  }) : updatedAtMicros = Value(updatedAtMicros);
  static Insertable<JpyBalanceRow> custom({
    Expression<int>? id,
    Expression<String>? available,
    Expression<String>? reserved,
    Expression<int>? updatedAtMicros,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (available != null) 'available': available,
      if (reserved != null) 'reserved': reserved,
      if (updatedAtMicros != null) 'updated_at_micros': updatedAtMicros,
    });
  }

  JpyBalancesCompanion copyWith({
    Value<int>? id,
    Value<FixedDecimal>? available,
    Value<FixedDecimal>? reserved,
    Value<int>? updatedAtMicros,
  }) {
    return JpyBalancesCompanion(
      id: id ?? this.id,
      available: available ?? this.available,
      reserved: reserved ?? this.reserved,
      updatedAtMicros: updatedAtMicros ?? this.updatedAtMicros,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (available.present) {
      map['available'] = Variable<String>(
        $JpyBalancesTable.$converteravailable.toSql(available.value),
      );
    }
    if (reserved.present) {
      map['reserved'] = Variable<String>(
        $JpyBalancesTable.$converterreserved.toSql(reserved.value),
      );
    }
    if (updatedAtMicros.present) {
      map['updated_at_micros'] = Variable<int>(updatedAtMicros.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JpyBalancesCompanion(')
          ..write('id: $id, ')
          ..write('available: $available, ')
          ..write('reserved: $reserved, ')
          ..write('updatedAtMicros: $updatedAtMicros')
          ..write(')'))
        .toString();
  }
}

class $AssetPositionsTable extends AssetPositions
    with TableInfo<$AssetPositionsTable, AssetPositionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssetPositionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 4,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String> quantity =
      GeneratedColumn<String>(
        'quantity',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 64,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<FixedDecimal>($AssetPositionsTable.$converterquantity);
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String>
  totalCostBasis = GeneratedColumn<String>(
    'total_cost_basis',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<FixedDecimal>($AssetPositionsTable.$convertertotalCostBasis);
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String>
  reservedQuantity =
      GeneratedColumn<String>(
        'reserved_quantity',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 64,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(zeroDecimalText),
      ).withConverter<FixedDecimal>(
        $AssetPositionsTable.$converterreservedQuantity,
      );
  static const VerificationMeta _updatedAtMicrosMeta = const VerificationMeta(
    'updatedAtMicros',
  );
  @override
  late final GeneratedColumn<int> updatedAtMicros = GeneratedColumn<int>(
    'updated_at_micros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    symbol,
    quantity,
    totalCostBasis,
    reservedQuantity,
    updatedAtMicros,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'asset_positions';
  @override
  VerificationContext validateIntegrity(
    Insertable<AssetPositionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('updated_at_micros')) {
      context.handle(
        _updatedAtMicrosMeta,
        updatedAtMicros.isAcceptableOrUnknown(
          data['updated_at_micros']!,
          _updatedAtMicrosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMicrosMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {symbol};
  @override
  AssetPositionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssetPositionRow(
      symbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol'],
      )!,
      quantity: $AssetPositionsTable.$converterquantity.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}quantity'],
        )!,
      ),
      totalCostBasis: $AssetPositionsTable.$convertertotalCostBasis.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}total_cost_basis'],
        )!,
      ),
      reservedQuantity: $AssetPositionsTable.$converterreservedQuantity.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reserved_quantity'],
        )!,
      ),
      updatedAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at_micros'],
      )!,
    );
  }

  @override
  $AssetPositionsTable createAlias(String alias) {
    return $AssetPositionsTable(attachedDatabase, alias);
  }

  static TypeConverter<FixedDecimal, String> $converterquantity =
      const FixedDecimalConverter();
  static TypeConverter<FixedDecimal, String> $convertertotalCostBasis =
      const FixedDecimalConverter();
  static TypeConverter<FixedDecimal, String> $converterreservedQuantity =
      const FixedDecimalConverter();
  @override
  bool get isStrict => true;
}

class AssetPositionRow extends DataClass
    implements Insertable<AssetPositionRow> {
  final String symbol;
  final FixedDecimal quantity;
  final FixedDecimal totalCostBasis;
  final FixedDecimal reservedQuantity;
  final int updatedAtMicros;
  const AssetPositionRow({
    required this.symbol,
    required this.quantity,
    required this.totalCostBasis,
    required this.reservedQuantity,
    required this.updatedAtMicros,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['symbol'] = Variable<String>(symbol);
    {
      map['quantity'] = Variable<String>(
        $AssetPositionsTable.$converterquantity.toSql(quantity),
      );
    }
    {
      map['total_cost_basis'] = Variable<String>(
        $AssetPositionsTable.$convertertotalCostBasis.toSql(totalCostBasis),
      );
    }
    {
      map['reserved_quantity'] = Variable<String>(
        $AssetPositionsTable.$converterreservedQuantity.toSql(reservedQuantity),
      );
    }
    map['updated_at_micros'] = Variable<int>(updatedAtMicros);
    return map;
  }

  AssetPositionsCompanion toCompanion(bool nullToAbsent) {
    return AssetPositionsCompanion(
      symbol: Value(symbol),
      quantity: Value(quantity),
      totalCostBasis: Value(totalCostBasis),
      reservedQuantity: Value(reservedQuantity),
      updatedAtMicros: Value(updatedAtMicros),
    );
  }

  factory AssetPositionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssetPositionRow(
      symbol: serializer.fromJson<String>(json['symbol']),
      quantity: serializer.fromJson<FixedDecimal>(json['quantity']),
      totalCostBasis: serializer.fromJson<FixedDecimal>(json['totalCostBasis']),
      reservedQuantity: serializer.fromJson<FixedDecimal>(
        json['reservedQuantity'],
      ),
      updatedAtMicros: serializer.fromJson<int>(json['updatedAtMicros']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'symbol': serializer.toJson<String>(symbol),
      'quantity': serializer.toJson<FixedDecimal>(quantity),
      'totalCostBasis': serializer.toJson<FixedDecimal>(totalCostBasis),
      'reservedQuantity': serializer.toJson<FixedDecimal>(reservedQuantity),
      'updatedAtMicros': serializer.toJson<int>(updatedAtMicros),
    };
  }

  AssetPositionRow copyWith({
    String? symbol,
    FixedDecimal? quantity,
    FixedDecimal? totalCostBasis,
    FixedDecimal? reservedQuantity,
    int? updatedAtMicros,
  }) => AssetPositionRow(
    symbol: symbol ?? this.symbol,
    quantity: quantity ?? this.quantity,
    totalCostBasis: totalCostBasis ?? this.totalCostBasis,
    reservedQuantity: reservedQuantity ?? this.reservedQuantity,
    updatedAtMicros: updatedAtMicros ?? this.updatedAtMicros,
  );
  AssetPositionRow copyWithCompanion(AssetPositionsCompanion data) {
    return AssetPositionRow(
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      totalCostBasis: data.totalCostBasis.present
          ? data.totalCostBasis.value
          : this.totalCostBasis,
      reservedQuantity: data.reservedQuantity.present
          ? data.reservedQuantity.value
          : this.reservedQuantity,
      updatedAtMicros: data.updatedAtMicros.present
          ? data.updatedAtMicros.value
          : this.updatedAtMicros,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssetPositionRow(')
          ..write('symbol: $symbol, ')
          ..write('quantity: $quantity, ')
          ..write('totalCostBasis: $totalCostBasis, ')
          ..write('reservedQuantity: $reservedQuantity, ')
          ..write('updatedAtMicros: $updatedAtMicros')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    symbol,
    quantity,
    totalCostBasis,
    reservedQuantity,
    updatedAtMicros,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssetPositionRow &&
          other.symbol == this.symbol &&
          other.quantity == this.quantity &&
          other.totalCostBasis == this.totalCostBasis &&
          other.reservedQuantity == this.reservedQuantity &&
          other.updatedAtMicros == this.updatedAtMicros);
}

class AssetPositionsCompanion extends UpdateCompanion<AssetPositionRow> {
  final Value<String> symbol;
  final Value<FixedDecimal> quantity;
  final Value<FixedDecimal> totalCostBasis;
  final Value<FixedDecimal> reservedQuantity;
  final Value<int> updatedAtMicros;
  final Value<int> rowid;
  const AssetPositionsCompanion({
    this.symbol = const Value.absent(),
    this.quantity = const Value.absent(),
    this.totalCostBasis = const Value.absent(),
    this.reservedQuantity = const Value.absent(),
    this.updatedAtMicros = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssetPositionsCompanion.insert({
    required String symbol,
    required FixedDecimal quantity,
    required FixedDecimal totalCostBasis,
    this.reservedQuantity = const Value.absent(),
    required int updatedAtMicros,
    this.rowid = const Value.absent(),
  }) : symbol = Value(symbol),
       quantity = Value(quantity),
       totalCostBasis = Value(totalCostBasis),
       updatedAtMicros = Value(updatedAtMicros);
  static Insertable<AssetPositionRow> custom({
    Expression<String>? symbol,
    Expression<String>? quantity,
    Expression<String>? totalCostBasis,
    Expression<String>? reservedQuantity,
    Expression<int>? updatedAtMicros,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (symbol != null) 'symbol': symbol,
      if (quantity != null) 'quantity': quantity,
      if (totalCostBasis != null) 'total_cost_basis': totalCostBasis,
      if (reservedQuantity != null) 'reserved_quantity': reservedQuantity,
      if (updatedAtMicros != null) 'updated_at_micros': updatedAtMicros,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssetPositionsCompanion copyWith({
    Value<String>? symbol,
    Value<FixedDecimal>? quantity,
    Value<FixedDecimal>? totalCostBasis,
    Value<FixedDecimal>? reservedQuantity,
    Value<int>? updatedAtMicros,
    Value<int>? rowid,
  }) {
    return AssetPositionsCompanion(
      symbol: symbol ?? this.symbol,
      quantity: quantity ?? this.quantity,
      totalCostBasis: totalCostBasis ?? this.totalCostBasis,
      reservedQuantity: reservedQuantity ?? this.reservedQuantity,
      updatedAtMicros: updatedAtMicros ?? this.updatedAtMicros,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<String>(
        $AssetPositionsTable.$converterquantity.toSql(quantity.value),
      );
    }
    if (totalCostBasis.present) {
      map['total_cost_basis'] = Variable<String>(
        $AssetPositionsTable.$convertertotalCostBasis.toSql(
          totalCostBasis.value,
        ),
      );
    }
    if (reservedQuantity.present) {
      map['reserved_quantity'] = Variable<String>(
        $AssetPositionsTable.$converterreservedQuantity.toSql(
          reservedQuantity.value,
        ),
      );
    }
    if (updatedAtMicros.present) {
      map['updated_at_micros'] = Variable<int>(updatedAtMicros.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssetPositionsCompanion(')
          ..write('symbol: $symbol, ')
          ..write('quantity: $quantity, ')
          ..write('totalCostBasis: $totalCostBasis, ')
          ..write('reservedQuantity: $reservedQuantity, ')
          ..write('updatedAtMicros: $updatedAtMicros, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalOrdersTable extends LocalOrders
    with TableInfo<$LocalOrdersTable, LocalOrderRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalOrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _installationKeyMeta = const VerificationMeta(
    'installationKey',
  );
  @override
  late final GeneratedColumn<int> installationKey = GeneratedColumn<int>(
    'installation_key',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES app_installations (id) ON DELETE RESTRICT',
    ),
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _portfolioGenerationMeta =
      const VerificationMeta('portfolioGeneration');
  @override
  late final GeneratedColumn<int> portfolioGeneration = GeneratedColumn<int>(
    'portfolio_generation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderKindMeta = const VerificationMeta(
    'orderKind',
  );
  @override
  late final GeneratedColumn<String> orderKind = GeneratedColumn<String>(
    'order_kind',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 6,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sideMeta = const VerificationMeta('side');
  @override
  late final GeneratedColumn<String> side = GeneratedColumn<String>(
    'side',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 4,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 4,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 40,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isTerminalMeta = const VerificationMeta(
    'isTerminal',
  );
  @override
  late final GeneratedColumn<bool> isTerminal = GeneratedColumn<bool>(
    'is_terminal',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_terminal" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal?, String>
  requestedPrice = GeneratedColumn<String>(
    'requested_price',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<FixedDecimal?>($LocalOrdersTable.$converterrequestedPricen);
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String>
  requestedQuantity = GeneratedColumn<String>(
    'requested_quantity',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<FixedDecimal>($LocalOrdersTable.$converterrequestedQuantity);
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String>
  reservedJpy = GeneratedColumn<String>(
    'reserved_jpy',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(zeroDecimalText),
  ).withConverter<FixedDecimal>($LocalOrdersTable.$converterreservedJpy);
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String>
  reservedQuantity = GeneratedColumn<String>(
    'reserved_quantity',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(zeroDecimalText),
  ).withConverter<FixedDecimal>($LocalOrdersTable.$converterreservedQuantity);
  static const VerificationMeta _serverOrderIdMeta = const VerificationMeta(
    'serverOrderId',
  );
  @override
  late final GeneratedColumn<String> serverOrderId = GeneratedColumn<String>(
    'server_order_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _idempotencyKeyMeta = const VerificationMeta(
    'idempotencyKey',
  );
  @override
  late final GeneratedColumn<String> idempotencyKey = GeneratedColumn<String>(
    'idempotency_key',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _createdAtMicrosMeta = const VerificationMeta(
    'createdAtMicros',
  );
  @override
  late final GeneratedColumn<int> createdAtMicros = GeneratedColumn<int>(
    'created_at_micros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMicrosMeta = const VerificationMeta(
    'updatedAtMicros',
  );
  @override
  late final GeneratedColumn<int> updatedAtMicros = GeneratedColumn<int>(
    'updated_at_micros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    installationKey,
    portfolioGeneration,
    orderKind,
    side,
    symbol,
    status,
    isTerminal,
    requestedPrice,
    requestedQuantity,
    reservedJpy,
    reservedQuantity,
    serverOrderId,
    idempotencyKey,
    createdAtMicros,
    updatedAtMicros,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_orders';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalOrderRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('installation_key')) {
      context.handle(
        _installationKeyMeta,
        installationKey.isAcceptableOrUnknown(
          data['installation_key']!,
          _installationKeyMeta,
        ),
      );
    }
    if (data.containsKey('portfolio_generation')) {
      context.handle(
        _portfolioGenerationMeta,
        portfolioGeneration.isAcceptableOrUnknown(
          data['portfolio_generation']!,
          _portfolioGenerationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_portfolioGenerationMeta);
    }
    if (data.containsKey('order_kind')) {
      context.handle(
        _orderKindMeta,
        orderKind.isAcceptableOrUnknown(data['order_kind']!, _orderKindMeta),
      );
    } else if (isInserting) {
      context.missing(_orderKindMeta);
    }
    if (data.containsKey('side')) {
      context.handle(
        _sideMeta,
        side.isAcceptableOrUnknown(data['side']!, _sideMeta),
      );
    } else if (isInserting) {
      context.missing(_sideMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('is_terminal')) {
      context.handle(
        _isTerminalMeta,
        isTerminal.isAcceptableOrUnknown(data['is_terminal']!, _isTerminalMeta),
      );
    }
    if (data.containsKey('server_order_id')) {
      context.handle(
        _serverOrderIdMeta,
        serverOrderId.isAcceptableOrUnknown(
          data['server_order_id']!,
          _serverOrderIdMeta,
        ),
      );
    }
    if (data.containsKey('idempotency_key')) {
      context.handle(
        _idempotencyKeyMeta,
        idempotencyKey.isAcceptableOrUnknown(
          data['idempotency_key']!,
          _idempotencyKeyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idempotencyKeyMeta);
    }
    if (data.containsKey('created_at_micros')) {
      context.handle(
        _createdAtMicrosMeta,
        createdAtMicros.isAcceptableOrUnknown(
          data['created_at_micros']!,
          _createdAtMicrosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtMicrosMeta);
    }
    if (data.containsKey('updated_at_micros')) {
      context.handle(
        _updatedAtMicrosMeta,
        updatedAtMicros.isAcceptableOrUnknown(
          data['updated_at_micros']!,
          _updatedAtMicrosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMicrosMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalOrderRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalOrderRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      installationKey: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}installation_key'],
      )!,
      portfolioGeneration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}portfolio_generation'],
      )!,
      orderKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_kind'],
      )!,
      side: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}side'],
      )!,
      symbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      isTerminal: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_terminal'],
      )!,
      requestedPrice: $LocalOrdersTable.$converterrequestedPricen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}requested_price'],
        ),
      ),
      requestedQuantity: $LocalOrdersTable.$converterrequestedQuantity.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}requested_quantity'],
        )!,
      ),
      reservedJpy: $LocalOrdersTable.$converterreservedJpy.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reserved_jpy'],
        )!,
      ),
      reservedQuantity: $LocalOrdersTable.$converterreservedQuantity.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}reserved_quantity'],
        )!,
      ),
      serverOrderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_order_id'],
      ),
      idempotencyKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}idempotency_key'],
      )!,
      createdAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at_micros'],
      )!,
      updatedAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at_micros'],
      )!,
    );
  }

  @override
  $LocalOrdersTable createAlias(String alias) {
    return $LocalOrdersTable(attachedDatabase, alias);
  }

  static TypeConverter<FixedDecimal, String> $converterrequestedPrice =
      const FixedDecimalConverter();
  static TypeConverter<FixedDecimal?, String?> $converterrequestedPricen =
      NullAwareTypeConverter.wrap($converterrequestedPrice);
  static TypeConverter<FixedDecimal, String> $converterrequestedQuantity =
      const FixedDecimalConverter();
  static TypeConverter<FixedDecimal, String> $converterreservedJpy =
      const FixedDecimalConverter();
  static TypeConverter<FixedDecimal, String> $converterreservedQuantity =
      const FixedDecimalConverter();
  @override
  bool get isStrict => true;
}

class LocalOrderRow extends DataClass implements Insertable<LocalOrderRow> {
  final String id;
  final int installationKey;
  final int portfolioGeneration;
  final String orderKind;
  final String side;
  final String symbol;
  final String status;
  final bool isTerminal;
  final FixedDecimal? requestedPrice;
  final FixedDecimal requestedQuantity;
  final FixedDecimal reservedJpy;
  final FixedDecimal reservedQuantity;
  final String? serverOrderId;
  final String idempotencyKey;
  final int createdAtMicros;
  final int updatedAtMicros;
  const LocalOrderRow({
    required this.id,
    required this.installationKey,
    required this.portfolioGeneration,
    required this.orderKind,
    required this.side,
    required this.symbol,
    required this.status,
    required this.isTerminal,
    this.requestedPrice,
    required this.requestedQuantity,
    required this.reservedJpy,
    required this.reservedQuantity,
    this.serverOrderId,
    required this.idempotencyKey,
    required this.createdAtMicros,
    required this.updatedAtMicros,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['installation_key'] = Variable<int>(installationKey);
    map['portfolio_generation'] = Variable<int>(portfolioGeneration);
    map['order_kind'] = Variable<String>(orderKind);
    map['side'] = Variable<String>(side);
    map['symbol'] = Variable<String>(symbol);
    map['status'] = Variable<String>(status);
    map['is_terminal'] = Variable<bool>(isTerminal);
    if (!nullToAbsent || requestedPrice != null) {
      map['requested_price'] = Variable<String>(
        $LocalOrdersTable.$converterrequestedPricen.toSql(requestedPrice),
      );
    }
    {
      map['requested_quantity'] = Variable<String>(
        $LocalOrdersTable.$converterrequestedQuantity.toSql(requestedQuantity),
      );
    }
    {
      map['reserved_jpy'] = Variable<String>(
        $LocalOrdersTable.$converterreservedJpy.toSql(reservedJpy),
      );
    }
    {
      map['reserved_quantity'] = Variable<String>(
        $LocalOrdersTable.$converterreservedQuantity.toSql(reservedQuantity),
      );
    }
    if (!nullToAbsent || serverOrderId != null) {
      map['server_order_id'] = Variable<String>(serverOrderId);
    }
    map['idempotency_key'] = Variable<String>(idempotencyKey);
    map['created_at_micros'] = Variable<int>(createdAtMicros);
    map['updated_at_micros'] = Variable<int>(updatedAtMicros);
    return map;
  }

  LocalOrdersCompanion toCompanion(bool nullToAbsent) {
    return LocalOrdersCompanion(
      id: Value(id),
      installationKey: Value(installationKey),
      portfolioGeneration: Value(portfolioGeneration),
      orderKind: Value(orderKind),
      side: Value(side),
      symbol: Value(symbol),
      status: Value(status),
      isTerminal: Value(isTerminal),
      requestedPrice: requestedPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(requestedPrice),
      requestedQuantity: Value(requestedQuantity),
      reservedJpy: Value(reservedJpy),
      reservedQuantity: Value(reservedQuantity),
      serverOrderId: serverOrderId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverOrderId),
      idempotencyKey: Value(idempotencyKey),
      createdAtMicros: Value(createdAtMicros),
      updatedAtMicros: Value(updatedAtMicros),
    );
  }

  factory LocalOrderRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalOrderRow(
      id: serializer.fromJson<String>(json['id']),
      installationKey: serializer.fromJson<int>(json['installationKey']),
      portfolioGeneration: serializer.fromJson<int>(
        json['portfolioGeneration'],
      ),
      orderKind: serializer.fromJson<String>(json['orderKind']),
      side: serializer.fromJson<String>(json['side']),
      symbol: serializer.fromJson<String>(json['symbol']),
      status: serializer.fromJson<String>(json['status']),
      isTerminal: serializer.fromJson<bool>(json['isTerminal']),
      requestedPrice: serializer.fromJson<FixedDecimal?>(
        json['requestedPrice'],
      ),
      requestedQuantity: serializer.fromJson<FixedDecimal>(
        json['requestedQuantity'],
      ),
      reservedJpy: serializer.fromJson<FixedDecimal>(json['reservedJpy']),
      reservedQuantity: serializer.fromJson<FixedDecimal>(
        json['reservedQuantity'],
      ),
      serverOrderId: serializer.fromJson<String?>(json['serverOrderId']),
      idempotencyKey: serializer.fromJson<String>(json['idempotencyKey']),
      createdAtMicros: serializer.fromJson<int>(json['createdAtMicros']),
      updatedAtMicros: serializer.fromJson<int>(json['updatedAtMicros']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'installationKey': serializer.toJson<int>(installationKey),
      'portfolioGeneration': serializer.toJson<int>(portfolioGeneration),
      'orderKind': serializer.toJson<String>(orderKind),
      'side': serializer.toJson<String>(side),
      'symbol': serializer.toJson<String>(symbol),
      'status': serializer.toJson<String>(status),
      'isTerminal': serializer.toJson<bool>(isTerminal),
      'requestedPrice': serializer.toJson<FixedDecimal?>(requestedPrice),
      'requestedQuantity': serializer.toJson<FixedDecimal>(requestedQuantity),
      'reservedJpy': serializer.toJson<FixedDecimal>(reservedJpy),
      'reservedQuantity': serializer.toJson<FixedDecimal>(reservedQuantity),
      'serverOrderId': serializer.toJson<String?>(serverOrderId),
      'idempotencyKey': serializer.toJson<String>(idempotencyKey),
      'createdAtMicros': serializer.toJson<int>(createdAtMicros),
      'updatedAtMicros': serializer.toJson<int>(updatedAtMicros),
    };
  }

  LocalOrderRow copyWith({
    String? id,
    int? installationKey,
    int? portfolioGeneration,
    String? orderKind,
    String? side,
    String? symbol,
    String? status,
    bool? isTerminal,
    Value<FixedDecimal?> requestedPrice = const Value.absent(),
    FixedDecimal? requestedQuantity,
    FixedDecimal? reservedJpy,
    FixedDecimal? reservedQuantity,
    Value<String?> serverOrderId = const Value.absent(),
    String? idempotencyKey,
    int? createdAtMicros,
    int? updatedAtMicros,
  }) => LocalOrderRow(
    id: id ?? this.id,
    installationKey: installationKey ?? this.installationKey,
    portfolioGeneration: portfolioGeneration ?? this.portfolioGeneration,
    orderKind: orderKind ?? this.orderKind,
    side: side ?? this.side,
    symbol: symbol ?? this.symbol,
    status: status ?? this.status,
    isTerminal: isTerminal ?? this.isTerminal,
    requestedPrice: requestedPrice.present
        ? requestedPrice.value
        : this.requestedPrice,
    requestedQuantity: requestedQuantity ?? this.requestedQuantity,
    reservedJpy: reservedJpy ?? this.reservedJpy,
    reservedQuantity: reservedQuantity ?? this.reservedQuantity,
    serverOrderId: serverOrderId.present
        ? serverOrderId.value
        : this.serverOrderId,
    idempotencyKey: idempotencyKey ?? this.idempotencyKey,
    createdAtMicros: createdAtMicros ?? this.createdAtMicros,
    updatedAtMicros: updatedAtMicros ?? this.updatedAtMicros,
  );
  LocalOrderRow copyWithCompanion(LocalOrdersCompanion data) {
    return LocalOrderRow(
      id: data.id.present ? data.id.value : this.id,
      installationKey: data.installationKey.present
          ? data.installationKey.value
          : this.installationKey,
      portfolioGeneration: data.portfolioGeneration.present
          ? data.portfolioGeneration.value
          : this.portfolioGeneration,
      orderKind: data.orderKind.present ? data.orderKind.value : this.orderKind,
      side: data.side.present ? data.side.value : this.side,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      status: data.status.present ? data.status.value : this.status,
      isTerminal: data.isTerminal.present
          ? data.isTerminal.value
          : this.isTerminal,
      requestedPrice: data.requestedPrice.present
          ? data.requestedPrice.value
          : this.requestedPrice,
      requestedQuantity: data.requestedQuantity.present
          ? data.requestedQuantity.value
          : this.requestedQuantity,
      reservedJpy: data.reservedJpy.present
          ? data.reservedJpy.value
          : this.reservedJpy,
      reservedQuantity: data.reservedQuantity.present
          ? data.reservedQuantity.value
          : this.reservedQuantity,
      serverOrderId: data.serverOrderId.present
          ? data.serverOrderId.value
          : this.serverOrderId,
      idempotencyKey: data.idempotencyKey.present
          ? data.idempotencyKey.value
          : this.idempotencyKey,
      createdAtMicros: data.createdAtMicros.present
          ? data.createdAtMicros.value
          : this.createdAtMicros,
      updatedAtMicros: data.updatedAtMicros.present
          ? data.updatedAtMicros.value
          : this.updatedAtMicros,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalOrderRow(')
          ..write('id: $id, ')
          ..write('installationKey: $installationKey, ')
          ..write('portfolioGeneration: $portfolioGeneration, ')
          ..write('orderKind: $orderKind, ')
          ..write('side: $side, ')
          ..write('symbol: $symbol, ')
          ..write('status: $status, ')
          ..write('isTerminal: $isTerminal, ')
          ..write('requestedPrice: $requestedPrice, ')
          ..write('requestedQuantity: $requestedQuantity, ')
          ..write('reservedJpy: $reservedJpy, ')
          ..write('reservedQuantity: $reservedQuantity, ')
          ..write('serverOrderId: $serverOrderId, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('createdAtMicros: $createdAtMicros, ')
          ..write('updatedAtMicros: $updatedAtMicros')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    installationKey,
    portfolioGeneration,
    orderKind,
    side,
    symbol,
    status,
    isTerminal,
    requestedPrice,
    requestedQuantity,
    reservedJpy,
    reservedQuantity,
    serverOrderId,
    idempotencyKey,
    createdAtMicros,
    updatedAtMicros,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalOrderRow &&
          other.id == this.id &&
          other.installationKey == this.installationKey &&
          other.portfolioGeneration == this.portfolioGeneration &&
          other.orderKind == this.orderKind &&
          other.side == this.side &&
          other.symbol == this.symbol &&
          other.status == this.status &&
          other.isTerminal == this.isTerminal &&
          other.requestedPrice == this.requestedPrice &&
          other.requestedQuantity == this.requestedQuantity &&
          other.reservedJpy == this.reservedJpy &&
          other.reservedQuantity == this.reservedQuantity &&
          other.serverOrderId == this.serverOrderId &&
          other.idempotencyKey == this.idempotencyKey &&
          other.createdAtMicros == this.createdAtMicros &&
          other.updatedAtMicros == this.updatedAtMicros);
}

class LocalOrdersCompanion extends UpdateCompanion<LocalOrderRow> {
  final Value<String> id;
  final Value<int> installationKey;
  final Value<int> portfolioGeneration;
  final Value<String> orderKind;
  final Value<String> side;
  final Value<String> symbol;
  final Value<String> status;
  final Value<bool> isTerminal;
  final Value<FixedDecimal?> requestedPrice;
  final Value<FixedDecimal> requestedQuantity;
  final Value<FixedDecimal> reservedJpy;
  final Value<FixedDecimal> reservedQuantity;
  final Value<String?> serverOrderId;
  final Value<String> idempotencyKey;
  final Value<int> createdAtMicros;
  final Value<int> updatedAtMicros;
  final Value<int> rowid;
  const LocalOrdersCompanion({
    this.id = const Value.absent(),
    this.installationKey = const Value.absent(),
    this.portfolioGeneration = const Value.absent(),
    this.orderKind = const Value.absent(),
    this.side = const Value.absent(),
    this.symbol = const Value.absent(),
    this.status = const Value.absent(),
    this.isTerminal = const Value.absent(),
    this.requestedPrice = const Value.absent(),
    this.requestedQuantity = const Value.absent(),
    this.reservedJpy = const Value.absent(),
    this.reservedQuantity = const Value.absent(),
    this.serverOrderId = const Value.absent(),
    this.idempotencyKey = const Value.absent(),
    this.createdAtMicros = const Value.absent(),
    this.updatedAtMicros = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalOrdersCompanion.insert({
    required String id,
    this.installationKey = const Value.absent(),
    required int portfolioGeneration,
    required String orderKind,
    required String side,
    required String symbol,
    required String status,
    this.isTerminal = const Value.absent(),
    this.requestedPrice = const Value.absent(),
    required FixedDecimal requestedQuantity,
    this.reservedJpy = const Value.absent(),
    this.reservedQuantity = const Value.absent(),
    this.serverOrderId = const Value.absent(),
    required String idempotencyKey,
    required int createdAtMicros,
    required int updatedAtMicros,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       portfolioGeneration = Value(portfolioGeneration),
       orderKind = Value(orderKind),
       side = Value(side),
       symbol = Value(symbol),
       status = Value(status),
       requestedQuantity = Value(requestedQuantity),
       idempotencyKey = Value(idempotencyKey),
       createdAtMicros = Value(createdAtMicros),
       updatedAtMicros = Value(updatedAtMicros);
  static Insertable<LocalOrderRow> custom({
    Expression<String>? id,
    Expression<int>? installationKey,
    Expression<int>? portfolioGeneration,
    Expression<String>? orderKind,
    Expression<String>? side,
    Expression<String>? symbol,
    Expression<String>? status,
    Expression<bool>? isTerminal,
    Expression<String>? requestedPrice,
    Expression<String>? requestedQuantity,
    Expression<String>? reservedJpy,
    Expression<String>? reservedQuantity,
    Expression<String>? serverOrderId,
    Expression<String>? idempotencyKey,
    Expression<int>? createdAtMicros,
    Expression<int>? updatedAtMicros,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (installationKey != null) 'installation_key': installationKey,
      if (portfolioGeneration != null)
        'portfolio_generation': portfolioGeneration,
      if (orderKind != null) 'order_kind': orderKind,
      if (side != null) 'side': side,
      if (symbol != null) 'symbol': symbol,
      if (status != null) 'status': status,
      if (isTerminal != null) 'is_terminal': isTerminal,
      if (requestedPrice != null) 'requested_price': requestedPrice,
      if (requestedQuantity != null) 'requested_quantity': requestedQuantity,
      if (reservedJpy != null) 'reserved_jpy': reservedJpy,
      if (reservedQuantity != null) 'reserved_quantity': reservedQuantity,
      if (serverOrderId != null) 'server_order_id': serverOrderId,
      if (idempotencyKey != null) 'idempotency_key': idempotencyKey,
      if (createdAtMicros != null) 'created_at_micros': createdAtMicros,
      if (updatedAtMicros != null) 'updated_at_micros': updatedAtMicros,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalOrdersCompanion copyWith({
    Value<String>? id,
    Value<int>? installationKey,
    Value<int>? portfolioGeneration,
    Value<String>? orderKind,
    Value<String>? side,
    Value<String>? symbol,
    Value<String>? status,
    Value<bool>? isTerminal,
    Value<FixedDecimal?>? requestedPrice,
    Value<FixedDecimal>? requestedQuantity,
    Value<FixedDecimal>? reservedJpy,
    Value<FixedDecimal>? reservedQuantity,
    Value<String?>? serverOrderId,
    Value<String>? idempotencyKey,
    Value<int>? createdAtMicros,
    Value<int>? updatedAtMicros,
    Value<int>? rowid,
  }) {
    return LocalOrdersCompanion(
      id: id ?? this.id,
      installationKey: installationKey ?? this.installationKey,
      portfolioGeneration: portfolioGeneration ?? this.portfolioGeneration,
      orderKind: orderKind ?? this.orderKind,
      side: side ?? this.side,
      symbol: symbol ?? this.symbol,
      status: status ?? this.status,
      isTerminal: isTerminal ?? this.isTerminal,
      requestedPrice: requestedPrice ?? this.requestedPrice,
      requestedQuantity: requestedQuantity ?? this.requestedQuantity,
      reservedJpy: reservedJpy ?? this.reservedJpy,
      reservedQuantity: reservedQuantity ?? this.reservedQuantity,
      serverOrderId: serverOrderId ?? this.serverOrderId,
      idempotencyKey: idempotencyKey ?? this.idempotencyKey,
      createdAtMicros: createdAtMicros ?? this.createdAtMicros,
      updatedAtMicros: updatedAtMicros ?? this.updatedAtMicros,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (installationKey.present) {
      map['installation_key'] = Variable<int>(installationKey.value);
    }
    if (portfolioGeneration.present) {
      map['portfolio_generation'] = Variable<int>(portfolioGeneration.value);
    }
    if (orderKind.present) {
      map['order_kind'] = Variable<String>(orderKind.value);
    }
    if (side.present) {
      map['side'] = Variable<String>(side.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (isTerminal.present) {
      map['is_terminal'] = Variable<bool>(isTerminal.value);
    }
    if (requestedPrice.present) {
      map['requested_price'] = Variable<String>(
        $LocalOrdersTable.$converterrequestedPricen.toSql(requestedPrice.value),
      );
    }
    if (requestedQuantity.present) {
      map['requested_quantity'] = Variable<String>(
        $LocalOrdersTable.$converterrequestedQuantity.toSql(
          requestedQuantity.value,
        ),
      );
    }
    if (reservedJpy.present) {
      map['reserved_jpy'] = Variable<String>(
        $LocalOrdersTable.$converterreservedJpy.toSql(reservedJpy.value),
      );
    }
    if (reservedQuantity.present) {
      map['reserved_quantity'] = Variable<String>(
        $LocalOrdersTable.$converterreservedQuantity.toSql(
          reservedQuantity.value,
        ),
      );
    }
    if (serverOrderId.present) {
      map['server_order_id'] = Variable<String>(serverOrderId.value);
    }
    if (idempotencyKey.present) {
      map['idempotency_key'] = Variable<String>(idempotencyKey.value);
    }
    if (createdAtMicros.present) {
      map['created_at_micros'] = Variable<int>(createdAtMicros.value);
    }
    if (updatedAtMicros.present) {
      map['updated_at_micros'] = Variable<int>(updatedAtMicros.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalOrdersCompanion(')
          ..write('id: $id, ')
          ..write('installationKey: $installationKey, ')
          ..write('portfolioGeneration: $portfolioGeneration, ')
          ..write('orderKind: $orderKind, ')
          ..write('side: $side, ')
          ..write('symbol: $symbol, ')
          ..write('status: $status, ')
          ..write('isTerminal: $isTerminal, ')
          ..write('requestedPrice: $requestedPrice, ')
          ..write('requestedQuantity: $requestedQuantity, ')
          ..write('reservedJpy: $reservedJpy, ')
          ..write('reservedQuantity: $reservedQuantity, ')
          ..write('serverOrderId: $serverOrderId, ')
          ..write('idempotencyKey: $idempotencyKey, ')
          ..write('createdAtMicros: $createdAtMicros, ')
          ..write('updatedAtMicros: $updatedAtMicros, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TradeExecutionsTable extends TradeExecutions
    with TableInfo<$TradeExecutionsTable, TradeExecutionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TradeExecutionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<String> orderId = GeneratedColumn<String>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES local_orders (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _liquidityRoleMeta = const VerificationMeta(
    'liquidityRole',
  );
  @override
  late final GeneratedColumn<String> liquidityRole = GeneratedColumn<String>(
    'liquidity_role',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 5,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String> price =
      GeneratedColumn<String>(
        'price',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 64,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<FixedDecimal>($TradeExecutionsTable.$converterprice);
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String> quantity =
      GeneratedColumn<String>(
        'quantity',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 64,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<FixedDecimal>($TradeExecutionsTable.$converterquantity);
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String>
  grossAmount = GeneratedColumn<String>(
    'gross_amount',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 64,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<FixedDecimal>($TradeExecutionsTable.$convertergrossAmount);
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String> fee =
      GeneratedColumn<String>(
        'fee',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 64,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<FixedDecimal>($TradeExecutionsTable.$converterfee);
  @override
  late final GeneratedColumnWithTypeConverter<FixedDecimal, String>
  settlementAmount =
      GeneratedColumn<String>(
        'settlement_amount',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 64,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<FixedDecimal>(
        $TradeExecutionsTable.$convertersettlementAmount,
      );
  static const VerificationMeta _executedAtMicrosMeta = const VerificationMeta(
    'executedAtMicros',
  );
  @override
  late final GeneratedColumn<int> executedAtMicros = GeneratedColumn<int>(
    'executed_at_micros',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orderId,
    liquidityRole,
    price,
    quantity,
    grossAmount,
    fee,
    settlementAmount,
    executedAtMicros,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trade_executions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TradeExecutionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('liquidity_role')) {
      context.handle(
        _liquidityRoleMeta,
        liquidityRole.isAcceptableOrUnknown(
          data['liquidity_role']!,
          _liquidityRoleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_liquidityRoleMeta);
    }
    if (data.containsKey('executed_at_micros')) {
      context.handle(
        _executedAtMicrosMeta,
        executedAtMicros.isAcceptableOrUnknown(
          data['executed_at_micros']!,
          _executedAtMicrosMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_executedAtMicrosMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TradeExecutionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TradeExecutionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_id'],
      )!,
      liquidityRole: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}liquidity_role'],
      )!,
      price: $TradeExecutionsTable.$converterprice.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}price'],
        )!,
      ),
      quantity: $TradeExecutionsTable.$converterquantity.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}quantity'],
        )!,
      ),
      grossAmount: $TradeExecutionsTable.$convertergrossAmount.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}gross_amount'],
        )!,
      ),
      fee: $TradeExecutionsTable.$converterfee.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}fee'],
        )!,
      ),
      settlementAmount: $TradeExecutionsTable.$convertersettlementAmount
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}settlement_amount'],
            )!,
          ),
      executedAtMicros: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}executed_at_micros'],
      )!,
    );
  }

  @override
  $TradeExecutionsTable createAlias(String alias) {
    return $TradeExecutionsTable(attachedDatabase, alias);
  }

  static TypeConverter<FixedDecimal, String> $converterprice =
      const FixedDecimalConverter();
  static TypeConverter<FixedDecimal, String> $converterquantity =
      const FixedDecimalConverter();
  static TypeConverter<FixedDecimal, String> $convertergrossAmount =
      const FixedDecimalConverter();
  static TypeConverter<FixedDecimal, String> $converterfee =
      const FixedDecimalConverter();
  static TypeConverter<FixedDecimal, String> $convertersettlementAmount =
      const FixedDecimalConverter();
  @override
  bool get isStrict => true;
}

class TradeExecutionRow extends DataClass
    implements Insertable<TradeExecutionRow> {
  final String id;
  final String orderId;
  final String liquidityRole;
  final FixedDecimal price;
  final FixedDecimal quantity;
  final FixedDecimal grossAmount;
  final FixedDecimal fee;
  final FixedDecimal settlementAmount;
  final int executedAtMicros;
  const TradeExecutionRow({
    required this.id,
    required this.orderId,
    required this.liquidityRole,
    required this.price,
    required this.quantity,
    required this.grossAmount,
    required this.fee,
    required this.settlementAmount,
    required this.executedAtMicros,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['order_id'] = Variable<String>(orderId);
    map['liquidity_role'] = Variable<String>(liquidityRole);
    {
      map['price'] = Variable<String>(
        $TradeExecutionsTable.$converterprice.toSql(price),
      );
    }
    {
      map['quantity'] = Variable<String>(
        $TradeExecutionsTable.$converterquantity.toSql(quantity),
      );
    }
    {
      map['gross_amount'] = Variable<String>(
        $TradeExecutionsTable.$convertergrossAmount.toSql(grossAmount),
      );
    }
    {
      map['fee'] = Variable<String>(
        $TradeExecutionsTable.$converterfee.toSql(fee),
      );
    }
    {
      map['settlement_amount'] = Variable<String>(
        $TradeExecutionsTable.$convertersettlementAmount.toSql(
          settlementAmount,
        ),
      );
    }
    map['executed_at_micros'] = Variable<int>(executedAtMicros);
    return map;
  }

  TradeExecutionsCompanion toCompanion(bool nullToAbsent) {
    return TradeExecutionsCompanion(
      id: Value(id),
      orderId: Value(orderId),
      liquidityRole: Value(liquidityRole),
      price: Value(price),
      quantity: Value(quantity),
      grossAmount: Value(grossAmount),
      fee: Value(fee),
      settlementAmount: Value(settlementAmount),
      executedAtMicros: Value(executedAtMicros),
    );
  }

  factory TradeExecutionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TradeExecutionRow(
      id: serializer.fromJson<String>(json['id']),
      orderId: serializer.fromJson<String>(json['orderId']),
      liquidityRole: serializer.fromJson<String>(json['liquidityRole']),
      price: serializer.fromJson<FixedDecimal>(json['price']),
      quantity: serializer.fromJson<FixedDecimal>(json['quantity']),
      grossAmount: serializer.fromJson<FixedDecimal>(json['grossAmount']),
      fee: serializer.fromJson<FixedDecimal>(json['fee']),
      settlementAmount: serializer.fromJson<FixedDecimal>(
        json['settlementAmount'],
      ),
      executedAtMicros: serializer.fromJson<int>(json['executedAtMicros']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'orderId': serializer.toJson<String>(orderId),
      'liquidityRole': serializer.toJson<String>(liquidityRole),
      'price': serializer.toJson<FixedDecimal>(price),
      'quantity': serializer.toJson<FixedDecimal>(quantity),
      'grossAmount': serializer.toJson<FixedDecimal>(grossAmount),
      'fee': serializer.toJson<FixedDecimal>(fee),
      'settlementAmount': serializer.toJson<FixedDecimal>(settlementAmount),
      'executedAtMicros': serializer.toJson<int>(executedAtMicros),
    };
  }

  TradeExecutionRow copyWith({
    String? id,
    String? orderId,
    String? liquidityRole,
    FixedDecimal? price,
    FixedDecimal? quantity,
    FixedDecimal? grossAmount,
    FixedDecimal? fee,
    FixedDecimal? settlementAmount,
    int? executedAtMicros,
  }) => TradeExecutionRow(
    id: id ?? this.id,
    orderId: orderId ?? this.orderId,
    liquidityRole: liquidityRole ?? this.liquidityRole,
    price: price ?? this.price,
    quantity: quantity ?? this.quantity,
    grossAmount: grossAmount ?? this.grossAmount,
    fee: fee ?? this.fee,
    settlementAmount: settlementAmount ?? this.settlementAmount,
    executedAtMicros: executedAtMicros ?? this.executedAtMicros,
  );
  TradeExecutionRow copyWithCompanion(TradeExecutionsCompanion data) {
    return TradeExecutionRow(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      liquidityRole: data.liquidityRole.present
          ? data.liquidityRole.value
          : this.liquidityRole,
      price: data.price.present ? data.price.value : this.price,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      grossAmount: data.grossAmount.present
          ? data.grossAmount.value
          : this.grossAmount,
      fee: data.fee.present ? data.fee.value : this.fee,
      settlementAmount: data.settlementAmount.present
          ? data.settlementAmount.value
          : this.settlementAmount,
      executedAtMicros: data.executedAtMicros.present
          ? data.executedAtMicros.value
          : this.executedAtMicros,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TradeExecutionRow(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('liquidityRole: $liquidityRole, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('grossAmount: $grossAmount, ')
          ..write('fee: $fee, ')
          ..write('settlementAmount: $settlementAmount, ')
          ..write('executedAtMicros: $executedAtMicros')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    orderId,
    liquidityRole,
    price,
    quantity,
    grossAmount,
    fee,
    settlementAmount,
    executedAtMicros,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TradeExecutionRow &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.liquidityRole == this.liquidityRole &&
          other.price == this.price &&
          other.quantity == this.quantity &&
          other.grossAmount == this.grossAmount &&
          other.fee == this.fee &&
          other.settlementAmount == this.settlementAmount &&
          other.executedAtMicros == this.executedAtMicros);
}

class TradeExecutionsCompanion extends UpdateCompanion<TradeExecutionRow> {
  final Value<String> id;
  final Value<String> orderId;
  final Value<String> liquidityRole;
  final Value<FixedDecimal> price;
  final Value<FixedDecimal> quantity;
  final Value<FixedDecimal> grossAmount;
  final Value<FixedDecimal> fee;
  final Value<FixedDecimal> settlementAmount;
  final Value<int> executedAtMicros;
  final Value<int> rowid;
  const TradeExecutionsCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.liquidityRole = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.grossAmount = const Value.absent(),
    this.fee = const Value.absent(),
    this.settlementAmount = const Value.absent(),
    this.executedAtMicros = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TradeExecutionsCompanion.insert({
    required String id,
    required String orderId,
    required String liquidityRole,
    required FixedDecimal price,
    required FixedDecimal quantity,
    required FixedDecimal grossAmount,
    required FixedDecimal fee,
    required FixedDecimal settlementAmount,
    required int executedAtMicros,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       orderId = Value(orderId),
       liquidityRole = Value(liquidityRole),
       price = Value(price),
       quantity = Value(quantity),
       grossAmount = Value(grossAmount),
       fee = Value(fee),
       settlementAmount = Value(settlementAmount),
       executedAtMicros = Value(executedAtMicros);
  static Insertable<TradeExecutionRow> custom({
    Expression<String>? id,
    Expression<String>? orderId,
    Expression<String>? liquidityRole,
    Expression<String>? price,
    Expression<String>? quantity,
    Expression<String>? grossAmount,
    Expression<String>? fee,
    Expression<String>? settlementAmount,
    Expression<int>? executedAtMicros,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (liquidityRole != null) 'liquidity_role': liquidityRole,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (grossAmount != null) 'gross_amount': grossAmount,
      if (fee != null) 'fee': fee,
      if (settlementAmount != null) 'settlement_amount': settlementAmount,
      if (executedAtMicros != null) 'executed_at_micros': executedAtMicros,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TradeExecutionsCompanion copyWith({
    Value<String>? id,
    Value<String>? orderId,
    Value<String>? liquidityRole,
    Value<FixedDecimal>? price,
    Value<FixedDecimal>? quantity,
    Value<FixedDecimal>? grossAmount,
    Value<FixedDecimal>? fee,
    Value<FixedDecimal>? settlementAmount,
    Value<int>? executedAtMicros,
    Value<int>? rowid,
  }) {
    return TradeExecutionsCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      liquidityRole: liquidityRole ?? this.liquidityRole,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      grossAmount: grossAmount ?? this.grossAmount,
      fee: fee ?? this.fee,
      settlementAmount: settlementAmount ?? this.settlementAmount,
      executedAtMicros: executedAtMicros ?? this.executedAtMicros,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<String>(orderId.value);
    }
    if (liquidityRole.present) {
      map['liquidity_role'] = Variable<String>(liquidityRole.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(
        $TradeExecutionsTable.$converterprice.toSql(price.value),
      );
    }
    if (quantity.present) {
      map['quantity'] = Variable<String>(
        $TradeExecutionsTable.$converterquantity.toSql(quantity.value),
      );
    }
    if (grossAmount.present) {
      map['gross_amount'] = Variable<String>(
        $TradeExecutionsTable.$convertergrossAmount.toSql(grossAmount.value),
      );
    }
    if (fee.present) {
      map['fee'] = Variable<String>(
        $TradeExecutionsTable.$converterfee.toSql(fee.value),
      );
    }
    if (settlementAmount.present) {
      map['settlement_amount'] = Variable<String>(
        $TradeExecutionsTable.$convertersettlementAmount.toSql(
          settlementAmount.value,
        ),
      );
    }
    if (executedAtMicros.present) {
      map['executed_at_micros'] = Variable<int>(executedAtMicros.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TradeExecutionsCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('liquidityRole: $liquidityRole, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('grossAmount: $grossAmount, ')
          ..write('fee: $fee, ')
          ..write('settlementAmount: $settlementAmount, ')
          ..write('executedAtMicros: $executedAtMicros, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppInstallationsTable appInstallations = $AppInstallationsTable(
    this,
  );
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $JpyBalancesTable jpyBalances = $JpyBalancesTable(this);
  late final $AssetPositionsTable assetPositions = $AssetPositionsTable(this);
  late final $LocalOrdersTable localOrders = $LocalOrdersTable(this);
  late final $TradeExecutionsTable tradeExecutions = $TradeExecutionsTable(
    this,
  );
  late final Index localOrdersGenerationStatus = Index(
    'local_orders_generation_status',
    'CREATE INDEX local_orders_generation_status ON local_orders (portfolio_generation, status)',
  );
  late final Index tradeExecutionsTime = Index(
    'trade_executions_time',
    'CREATE INDEX trade_executions_time ON trade_executions (executed_at_micros)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    appInstallations,
    appSettings,
    jpyBalances,
    assetPositions,
    localOrders,
    tradeExecutions,
    localOrdersGenerationStatus,
    tradeExecutionsTime,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'local_orders',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('trade_executions', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$AppInstallationsTableCreateCompanionBuilder =
    AppInstallationsCompanion Function({
      Value<int> id,
      required String installationId,
      required int createdAtMicros,
      Value<bool> onboardingCompleted,
      Value<int> portfolioGeneration,
      Value<int?> lastResetAtMicros,
    });
typedef $$AppInstallationsTableUpdateCompanionBuilder =
    AppInstallationsCompanion Function({
      Value<int> id,
      Value<String> installationId,
      Value<int> createdAtMicros,
      Value<bool> onboardingCompleted,
      Value<int> portfolioGeneration,
      Value<int?> lastResetAtMicros,
    });

final class $$AppInstallationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AppInstallationsTable,
          AppInstallationRow
        > {
  $$AppInstallationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$LocalOrdersTable, List<LocalOrderRow>>
  _localOrdersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.localOrders,
    aliasName: 'app_installations__id__local_orders__installation_key',
  );

  $$LocalOrdersTableProcessedTableManager get localOrdersRefs {
    final manager = $$LocalOrdersTableTableManager(
      $_db,
      $_db.localOrders,
    ).filter((f) => f.installationKey.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_localOrdersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AppInstallationsTableFilterComposer
    extends Composer<_$AppDatabase, $AppInstallationsTable> {
  $$AppInstallationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get installationId => $composableBuilder(
    column: $table.installationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get onboardingCompleted => $composableBuilder(
    column: $table.onboardingCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get portfolioGeneration => $composableBuilder(
    column: $table.portfolioGeneration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastResetAtMicros => $composableBuilder(
    column: $table.lastResetAtMicros,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> localOrdersRefs(
    Expression<bool> Function($$LocalOrdersTableFilterComposer f) f,
  ) {
    final $$LocalOrdersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.localOrders,
      getReferencedColumn: (t) => t.installationKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalOrdersTableFilterComposer(
            $db: $db,
            $table: $db.localOrders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AppInstallationsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppInstallationsTable> {
  $$AppInstallationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get installationId => $composableBuilder(
    column: $table.installationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get onboardingCompleted => $composableBuilder(
    column: $table.onboardingCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get portfolioGeneration => $composableBuilder(
    column: $table.portfolioGeneration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastResetAtMicros => $composableBuilder(
    column: $table.lastResetAtMicros,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppInstallationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppInstallationsTable> {
  $$AppInstallationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get installationId => $composableBuilder(
    column: $table.installationId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get onboardingCompleted => $composableBuilder(
    column: $table.onboardingCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get portfolioGeneration => $composableBuilder(
    column: $table.portfolioGeneration,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastResetAtMicros => $composableBuilder(
    column: $table.lastResetAtMicros,
    builder: (column) => column,
  );

  Expression<T> localOrdersRefs<T extends Object>(
    Expression<T> Function($$LocalOrdersTableAnnotationComposer a) f,
  ) {
    final $$LocalOrdersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.localOrders,
      getReferencedColumn: (t) => t.installationKey,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalOrdersTableAnnotationComposer(
            $db: $db,
            $table: $db.localOrders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AppInstallationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppInstallationsTable,
          AppInstallationRow,
          $$AppInstallationsTableFilterComposer,
          $$AppInstallationsTableOrderingComposer,
          $$AppInstallationsTableAnnotationComposer,
          $$AppInstallationsTableCreateCompanionBuilder,
          $$AppInstallationsTableUpdateCompanionBuilder,
          (AppInstallationRow, $$AppInstallationsTableReferences),
          AppInstallationRow,
          PrefetchHooks Function({bool localOrdersRefs})
        > {
  $$AppInstallationsTableTableManager(
    _$AppDatabase db,
    $AppInstallationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppInstallationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppInstallationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppInstallationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> installationId = const Value.absent(),
                Value<int> createdAtMicros = const Value.absent(),
                Value<bool> onboardingCompleted = const Value.absent(),
                Value<int> portfolioGeneration = const Value.absent(),
                Value<int?> lastResetAtMicros = const Value.absent(),
              }) => AppInstallationsCompanion(
                id: id,
                installationId: installationId,
                createdAtMicros: createdAtMicros,
                onboardingCompleted: onboardingCompleted,
                portfolioGeneration: portfolioGeneration,
                lastResetAtMicros: lastResetAtMicros,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String installationId,
                required int createdAtMicros,
                Value<bool> onboardingCompleted = const Value.absent(),
                Value<int> portfolioGeneration = const Value.absent(),
                Value<int?> lastResetAtMicros = const Value.absent(),
              }) => AppInstallationsCompanion.insert(
                id: id,
                installationId: installationId,
                createdAtMicros: createdAtMicros,
                onboardingCompleted: onboardingCompleted,
                portfolioGeneration: portfolioGeneration,
                lastResetAtMicros: lastResetAtMicros,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AppInstallationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({localOrdersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (localOrdersRefs) db.localOrders],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (localOrdersRefs)
                    await $_getPrefetchedData<
                      AppInstallationRow,
                      $AppInstallationsTable,
                      LocalOrderRow
                    >(
                      currentTable: table,
                      referencedTable: $$AppInstallationsTableReferences
                          ._localOrdersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AppInstallationsTableReferences(
                            db,
                            table,
                            p0,
                          ).localOrdersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.installationKey == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AppInstallationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppInstallationsTable,
      AppInstallationRow,
      $$AppInstallationsTableFilterComposer,
      $$AppInstallationsTableOrderingComposer,
      $$AppInstallationsTableAnnotationComposer,
      $$AppInstallationsTableCreateCompanionBuilder,
      $$AppInstallationsTableUpdateCompanionBuilder,
      (AppInstallationRow, $$AppInstallationsTableReferences),
      AppInstallationRow,
      PrefetchHooks Function({bool localOrdersRefs})
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String key,
      required String value,
      required int updatedAtMicros,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> updatedAtMicros,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => column,
  );
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSettingRow,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSettingRow,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSettingRow>,
          ),
          AppSettingRow,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> updatedAtMicros = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                key: key,
                value: value,
                updatedAtMicros: updatedAtMicros,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                required int updatedAtMicros,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                key: key,
                value: value,
                updatedAtMicros: updatedAtMicros,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSettingRow,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSettingRow,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSettingRow>,
      ),
      AppSettingRow,
      PrefetchHooks Function()
    >;
typedef $$JpyBalancesTableCreateCompanionBuilder =
    JpyBalancesCompanion Function({
      Value<int> id,
      Value<FixedDecimal> available,
      Value<FixedDecimal> reserved,
      required int updatedAtMicros,
    });
typedef $$JpyBalancesTableUpdateCompanionBuilder =
    JpyBalancesCompanion Function({
      Value<int> id,
      Value<FixedDecimal> available,
      Value<FixedDecimal> reserved,
      Value<int> updatedAtMicros,
    });

class $$JpyBalancesTableFilterComposer
    extends Composer<_$AppDatabase, $JpyBalancesTable> {
  $$JpyBalancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get available => $composableBuilder(
    column: $table.available,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get reserved => $composableBuilder(
    column: $table.reserved,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => ColumnFilters(column),
  );
}

class $$JpyBalancesTableOrderingComposer
    extends Composer<_$AppDatabase, $JpyBalancesTable> {
  $$JpyBalancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get available => $composableBuilder(
    column: $table.available,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reserved => $composableBuilder(
    column: $table.reserved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JpyBalancesTableAnnotationComposer
    extends Composer<_$AppDatabase, $JpyBalancesTable> {
  $$JpyBalancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get available =>
      $composableBuilder(column: $table.available, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get reserved =>
      $composableBuilder(column: $table.reserved, builder: (column) => column);

  GeneratedColumn<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => column,
  );
}

class $$JpyBalancesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JpyBalancesTable,
          JpyBalanceRow,
          $$JpyBalancesTableFilterComposer,
          $$JpyBalancesTableOrderingComposer,
          $$JpyBalancesTableAnnotationComposer,
          $$JpyBalancesTableCreateCompanionBuilder,
          $$JpyBalancesTableUpdateCompanionBuilder,
          (
            JpyBalanceRow,
            BaseReferences<_$AppDatabase, $JpyBalancesTable, JpyBalanceRow>,
          ),
          JpyBalanceRow,
          PrefetchHooks Function()
        > {
  $$JpyBalancesTableTableManager(_$AppDatabase db, $JpyBalancesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JpyBalancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JpyBalancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JpyBalancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<FixedDecimal> available = const Value.absent(),
                Value<FixedDecimal> reserved = const Value.absent(),
                Value<int> updatedAtMicros = const Value.absent(),
              }) => JpyBalancesCompanion(
                id: id,
                available: available,
                reserved: reserved,
                updatedAtMicros: updatedAtMicros,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<FixedDecimal> available = const Value.absent(),
                Value<FixedDecimal> reserved = const Value.absent(),
                required int updatedAtMicros,
              }) => JpyBalancesCompanion.insert(
                id: id,
                available: available,
                reserved: reserved,
                updatedAtMicros: updatedAtMicros,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$JpyBalancesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JpyBalancesTable,
      JpyBalanceRow,
      $$JpyBalancesTableFilterComposer,
      $$JpyBalancesTableOrderingComposer,
      $$JpyBalancesTableAnnotationComposer,
      $$JpyBalancesTableCreateCompanionBuilder,
      $$JpyBalancesTableUpdateCompanionBuilder,
      (
        JpyBalanceRow,
        BaseReferences<_$AppDatabase, $JpyBalancesTable, JpyBalanceRow>,
      ),
      JpyBalanceRow,
      PrefetchHooks Function()
    >;
typedef $$AssetPositionsTableCreateCompanionBuilder =
    AssetPositionsCompanion Function({
      required String symbol,
      required FixedDecimal quantity,
      required FixedDecimal totalCostBasis,
      Value<FixedDecimal> reservedQuantity,
      required int updatedAtMicros,
      Value<int> rowid,
    });
typedef $$AssetPositionsTableUpdateCompanionBuilder =
    AssetPositionsCompanion Function({
      Value<String> symbol,
      Value<FixedDecimal> quantity,
      Value<FixedDecimal> totalCostBasis,
      Value<FixedDecimal> reservedQuantity,
      Value<int> updatedAtMicros,
      Value<int> rowid,
    });

class $$AssetPositionsTableFilterComposer
    extends Composer<_$AppDatabase, $AssetPositionsTable> {
  $$AssetPositionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get totalCostBasis => $composableBuilder(
    column: $table.totalCostBasis,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get reservedQuantity => $composableBuilder(
    column: $table.reservedQuantity,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AssetPositionsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssetPositionsTable> {
  $$AssetPositionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get totalCostBasis => $composableBuilder(
    column: $table.totalCostBasis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reservedQuantity => $composableBuilder(
    column: $table.reservedQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AssetPositionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssetPositionsTable> {
  $$AssetPositionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get totalCostBasis =>
      $composableBuilder(
        column: $table.totalCostBasis,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get reservedQuantity =>
      $composableBuilder(
        column: $table.reservedQuantity,
        builder: (column) => column,
      );

  GeneratedColumn<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => column,
  );
}

class $$AssetPositionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssetPositionsTable,
          AssetPositionRow,
          $$AssetPositionsTableFilterComposer,
          $$AssetPositionsTableOrderingComposer,
          $$AssetPositionsTableAnnotationComposer,
          $$AssetPositionsTableCreateCompanionBuilder,
          $$AssetPositionsTableUpdateCompanionBuilder,
          (
            AssetPositionRow,
            BaseReferences<
              _$AppDatabase,
              $AssetPositionsTable,
              AssetPositionRow
            >,
          ),
          AssetPositionRow,
          PrefetchHooks Function()
        > {
  $$AssetPositionsTableTableManager(
    _$AppDatabase db,
    $AssetPositionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssetPositionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssetPositionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssetPositionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> symbol = const Value.absent(),
                Value<FixedDecimal> quantity = const Value.absent(),
                Value<FixedDecimal> totalCostBasis = const Value.absent(),
                Value<FixedDecimal> reservedQuantity = const Value.absent(),
                Value<int> updatedAtMicros = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AssetPositionsCompanion(
                symbol: symbol,
                quantity: quantity,
                totalCostBasis: totalCostBasis,
                reservedQuantity: reservedQuantity,
                updatedAtMicros: updatedAtMicros,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String symbol,
                required FixedDecimal quantity,
                required FixedDecimal totalCostBasis,
                Value<FixedDecimal> reservedQuantity = const Value.absent(),
                required int updatedAtMicros,
                Value<int> rowid = const Value.absent(),
              }) => AssetPositionsCompanion.insert(
                symbol: symbol,
                quantity: quantity,
                totalCostBasis: totalCostBasis,
                reservedQuantity: reservedQuantity,
                updatedAtMicros: updatedAtMicros,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AssetPositionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssetPositionsTable,
      AssetPositionRow,
      $$AssetPositionsTableFilterComposer,
      $$AssetPositionsTableOrderingComposer,
      $$AssetPositionsTableAnnotationComposer,
      $$AssetPositionsTableCreateCompanionBuilder,
      $$AssetPositionsTableUpdateCompanionBuilder,
      (
        AssetPositionRow,
        BaseReferences<_$AppDatabase, $AssetPositionsTable, AssetPositionRow>,
      ),
      AssetPositionRow,
      PrefetchHooks Function()
    >;
typedef $$LocalOrdersTableCreateCompanionBuilder =
    LocalOrdersCompanion Function({
      required String id,
      Value<int> installationKey,
      required int portfolioGeneration,
      required String orderKind,
      required String side,
      required String symbol,
      required String status,
      Value<bool> isTerminal,
      Value<FixedDecimal?> requestedPrice,
      required FixedDecimal requestedQuantity,
      Value<FixedDecimal> reservedJpy,
      Value<FixedDecimal> reservedQuantity,
      Value<String?> serverOrderId,
      required String idempotencyKey,
      required int createdAtMicros,
      required int updatedAtMicros,
      Value<int> rowid,
    });
typedef $$LocalOrdersTableUpdateCompanionBuilder =
    LocalOrdersCompanion Function({
      Value<String> id,
      Value<int> installationKey,
      Value<int> portfolioGeneration,
      Value<String> orderKind,
      Value<String> side,
      Value<String> symbol,
      Value<String> status,
      Value<bool> isTerminal,
      Value<FixedDecimal?> requestedPrice,
      Value<FixedDecimal> requestedQuantity,
      Value<FixedDecimal> reservedJpy,
      Value<FixedDecimal> reservedQuantity,
      Value<String?> serverOrderId,
      Value<String> idempotencyKey,
      Value<int> createdAtMicros,
      Value<int> updatedAtMicros,
      Value<int> rowid,
    });

final class $$LocalOrdersTableReferences
    extends BaseReferences<_$AppDatabase, $LocalOrdersTable, LocalOrderRow> {
  $$LocalOrdersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AppInstallationsTable _installationKeyTable(_$AppDatabase db) => db
      .appInstallations
      .createAlias('local_orders__installation_key__app_installations__id');

  $$AppInstallationsTableProcessedTableManager get installationKey {
    final $_column = $_itemColumn<int>('installation_key')!;

    final manager = $$AppInstallationsTableTableManager(
      $_db,
      $_db.appInstallations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_installationKeyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TradeExecutionsTable, List<TradeExecutionRow>>
  _tradeExecutionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tradeExecutions,
    aliasName: 'local_orders__id__trade_executions__order_id',
  );

  $$TradeExecutionsTableProcessedTableManager get tradeExecutionsRefs {
    final manager = $$TradeExecutionsTableTableManager(
      $_db,
      $_db.tradeExecutions,
    ).filter((f) => f.orderId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _tradeExecutionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LocalOrdersTableFilterComposer
    extends Composer<_$AppDatabase, $LocalOrdersTable> {
  $$LocalOrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get portfolioGeneration => $composableBuilder(
    column: $table.portfolioGeneration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderKind => $composableBuilder(
    column: $table.orderKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTerminal => $composableBuilder(
    column: $table.isTerminal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal?, FixedDecimal, String>
  get requestedPrice => $composableBuilder(
    column: $table.requestedPrice,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get requestedQuantity => $composableBuilder(
    column: $table.requestedQuantity,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get reservedJpy => $composableBuilder(
    column: $table.reservedJpy,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get reservedQuantity => $composableBuilder(
    column: $table.reservedQuantity,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get serverOrderId => $composableBuilder(
    column: $table.serverOrderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => ColumnFilters(column),
  );

  $$AppInstallationsTableFilterComposer get installationKey {
    final $$AppInstallationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.installationKey,
      referencedTable: $db.appInstallations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppInstallationsTableFilterComposer(
            $db: $db,
            $table: $db.appInstallations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> tradeExecutionsRefs(
    Expression<bool> Function($$TradeExecutionsTableFilterComposer f) f,
  ) {
    final $$TradeExecutionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tradeExecutions,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TradeExecutionsTableFilterComposer(
            $db: $db,
            $table: $db.tradeExecutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocalOrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalOrdersTable> {
  $$LocalOrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get portfolioGeneration => $composableBuilder(
    column: $table.portfolioGeneration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderKind => $composableBuilder(
    column: $table.orderKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get side => $composableBuilder(
    column: $table.side,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTerminal => $composableBuilder(
    column: $table.isTerminal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requestedPrice => $composableBuilder(
    column: $table.requestedPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get requestedQuantity => $composableBuilder(
    column: $table.requestedQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reservedJpy => $composableBuilder(
    column: $table.reservedJpy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reservedQuantity => $composableBuilder(
    column: $table.reservedQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverOrderId => $composableBuilder(
    column: $table.serverOrderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => ColumnOrderings(column),
  );

  $$AppInstallationsTableOrderingComposer get installationKey {
    final $$AppInstallationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.installationKey,
      referencedTable: $db.appInstallations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppInstallationsTableOrderingComposer(
            $db: $db,
            $table: $db.appInstallations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocalOrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalOrdersTable> {
  $$LocalOrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get portfolioGeneration => $composableBuilder(
    column: $table.portfolioGeneration,
    builder: (column) => column,
  );

  GeneratedColumn<String> get orderKind =>
      $composableBuilder(column: $table.orderKind, builder: (column) => column);

  GeneratedColumn<String> get side =>
      $composableBuilder(column: $table.side, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get isTerminal => $composableBuilder(
    column: $table.isTerminal,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<FixedDecimal?, String> get requestedPrice =>
      $composableBuilder(
        column: $table.requestedPrice,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<FixedDecimal, String>
  get requestedQuantity => $composableBuilder(
    column: $table.requestedQuantity,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get reservedJpy =>
      $composableBuilder(
        column: $table.reservedJpy,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get reservedQuantity =>
      $composableBuilder(
        column: $table.reservedQuantity,
        builder: (column) => column,
      );

  GeneratedColumn<String> get serverOrderId => $composableBuilder(
    column: $table.serverOrderId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get idempotencyKey => $composableBuilder(
    column: $table.idempotencyKey,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAtMicros => $composableBuilder(
    column: $table.createdAtMicros,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updatedAtMicros => $composableBuilder(
    column: $table.updatedAtMicros,
    builder: (column) => column,
  );

  $$AppInstallationsTableAnnotationComposer get installationKey {
    final $$AppInstallationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.installationKey,
      referencedTable: $db.appInstallations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppInstallationsTableAnnotationComposer(
            $db: $db,
            $table: $db.appInstallations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> tradeExecutionsRefs<T extends Object>(
    Expression<T> Function($$TradeExecutionsTableAnnotationComposer a) f,
  ) {
    final $$TradeExecutionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tradeExecutions,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TradeExecutionsTableAnnotationComposer(
            $db: $db,
            $table: $db.tradeExecutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocalOrdersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalOrdersTable,
          LocalOrderRow,
          $$LocalOrdersTableFilterComposer,
          $$LocalOrdersTableOrderingComposer,
          $$LocalOrdersTableAnnotationComposer,
          $$LocalOrdersTableCreateCompanionBuilder,
          $$LocalOrdersTableUpdateCompanionBuilder,
          (LocalOrderRow, $$LocalOrdersTableReferences),
          LocalOrderRow,
          PrefetchHooks Function({
            bool installationKey,
            bool tradeExecutionsRefs,
          })
        > {
  $$LocalOrdersTableTableManager(_$AppDatabase db, $LocalOrdersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalOrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalOrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalOrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> installationKey = const Value.absent(),
                Value<int> portfolioGeneration = const Value.absent(),
                Value<String> orderKind = const Value.absent(),
                Value<String> side = const Value.absent(),
                Value<String> symbol = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> isTerminal = const Value.absent(),
                Value<FixedDecimal?> requestedPrice = const Value.absent(),
                Value<FixedDecimal> requestedQuantity = const Value.absent(),
                Value<FixedDecimal> reservedJpy = const Value.absent(),
                Value<FixedDecimal> reservedQuantity = const Value.absent(),
                Value<String?> serverOrderId = const Value.absent(),
                Value<String> idempotencyKey = const Value.absent(),
                Value<int> createdAtMicros = const Value.absent(),
                Value<int> updatedAtMicros = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalOrdersCompanion(
                id: id,
                installationKey: installationKey,
                portfolioGeneration: portfolioGeneration,
                orderKind: orderKind,
                side: side,
                symbol: symbol,
                status: status,
                isTerminal: isTerminal,
                requestedPrice: requestedPrice,
                requestedQuantity: requestedQuantity,
                reservedJpy: reservedJpy,
                reservedQuantity: reservedQuantity,
                serverOrderId: serverOrderId,
                idempotencyKey: idempotencyKey,
                createdAtMicros: createdAtMicros,
                updatedAtMicros: updatedAtMicros,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<int> installationKey = const Value.absent(),
                required int portfolioGeneration,
                required String orderKind,
                required String side,
                required String symbol,
                required String status,
                Value<bool> isTerminal = const Value.absent(),
                Value<FixedDecimal?> requestedPrice = const Value.absent(),
                required FixedDecimal requestedQuantity,
                Value<FixedDecimal> reservedJpy = const Value.absent(),
                Value<FixedDecimal> reservedQuantity = const Value.absent(),
                Value<String?> serverOrderId = const Value.absent(),
                required String idempotencyKey,
                required int createdAtMicros,
                required int updatedAtMicros,
                Value<int> rowid = const Value.absent(),
              }) => LocalOrdersCompanion.insert(
                id: id,
                installationKey: installationKey,
                portfolioGeneration: portfolioGeneration,
                orderKind: orderKind,
                side: side,
                symbol: symbol,
                status: status,
                isTerminal: isTerminal,
                requestedPrice: requestedPrice,
                requestedQuantity: requestedQuantity,
                reservedJpy: reservedJpy,
                reservedQuantity: reservedQuantity,
                serverOrderId: serverOrderId,
                idempotencyKey: idempotencyKey,
                createdAtMicros: createdAtMicros,
                updatedAtMicros: updatedAtMicros,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LocalOrdersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({installationKey = false, tradeExecutionsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (tradeExecutionsRefs) db.tradeExecutions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (installationKey) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.installationKey,
                                    referencedTable:
                                        $$LocalOrdersTableReferences
                                            ._installationKeyTable(db),
                                    referencedColumn:
                                        $$LocalOrdersTableReferences
                                            ._installationKeyTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (tradeExecutionsRefs)
                        await $_getPrefetchedData<
                          LocalOrderRow,
                          $LocalOrdersTable,
                          TradeExecutionRow
                        >(
                          currentTable: table,
                          referencedTable: $$LocalOrdersTableReferences
                              ._tradeExecutionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LocalOrdersTableReferences(
                                db,
                                table,
                                p0,
                              ).tradeExecutionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.orderId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LocalOrdersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalOrdersTable,
      LocalOrderRow,
      $$LocalOrdersTableFilterComposer,
      $$LocalOrdersTableOrderingComposer,
      $$LocalOrdersTableAnnotationComposer,
      $$LocalOrdersTableCreateCompanionBuilder,
      $$LocalOrdersTableUpdateCompanionBuilder,
      (LocalOrderRow, $$LocalOrdersTableReferences),
      LocalOrderRow,
      PrefetchHooks Function({bool installationKey, bool tradeExecutionsRefs})
    >;
typedef $$TradeExecutionsTableCreateCompanionBuilder =
    TradeExecutionsCompanion Function({
      required String id,
      required String orderId,
      required String liquidityRole,
      required FixedDecimal price,
      required FixedDecimal quantity,
      required FixedDecimal grossAmount,
      required FixedDecimal fee,
      required FixedDecimal settlementAmount,
      required int executedAtMicros,
      Value<int> rowid,
    });
typedef $$TradeExecutionsTableUpdateCompanionBuilder =
    TradeExecutionsCompanion Function({
      Value<String> id,
      Value<String> orderId,
      Value<String> liquidityRole,
      Value<FixedDecimal> price,
      Value<FixedDecimal> quantity,
      Value<FixedDecimal> grossAmount,
      Value<FixedDecimal> fee,
      Value<FixedDecimal> settlementAmount,
      Value<int> executedAtMicros,
      Value<int> rowid,
    });

final class $$TradeExecutionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TradeExecutionsTable,
          TradeExecutionRow
        > {
  $$TradeExecutionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LocalOrdersTable _orderIdTable(_$AppDatabase db) => db.localOrders
      .createAlias('trade_executions__order_id__local_orders__id');

  $$LocalOrdersTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<String>('order_id')!;

    final manager = $$LocalOrdersTableTableManager(
      $_db,
      $_db.localOrders,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TradeExecutionsTableFilterComposer
    extends Composer<_$AppDatabase, $TradeExecutionsTable> {
  $$TradeExecutionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get liquidityRole => $composableBuilder(
    column: $table.liquidityRole,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get grossAmount => $composableBuilder(
    column: $table.grossAmount,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String> get fee =>
      $composableBuilder(
        column: $table.fee,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<FixedDecimal, FixedDecimal, String>
  get settlementAmount => $composableBuilder(
    column: $table.settlementAmount,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get executedAtMicros => $composableBuilder(
    column: $table.executedAtMicros,
    builder: (column) => ColumnFilters(column),
  );

  $$LocalOrdersTableFilterComposer get orderId {
    final $$LocalOrdersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.localOrders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalOrdersTableFilterComposer(
            $db: $db,
            $table: $db.localOrders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TradeExecutionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TradeExecutionsTable> {
  $$TradeExecutionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get liquidityRole => $composableBuilder(
    column: $table.liquidityRole,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get grossAmount => $composableBuilder(
    column: $table.grossAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fee => $composableBuilder(
    column: $table.fee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get settlementAmount => $composableBuilder(
    column: $table.settlementAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get executedAtMicros => $composableBuilder(
    column: $table.executedAtMicros,
    builder: (column) => ColumnOrderings(column),
  );

  $$LocalOrdersTableOrderingComposer get orderId {
    final $$LocalOrdersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.localOrders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalOrdersTableOrderingComposer(
            $db: $db,
            $table: $db.localOrders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TradeExecutionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TradeExecutionsTable> {
  $$TradeExecutionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get liquidityRole => $composableBuilder(
    column: $table.liquidityRole,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get grossAmount =>
      $composableBuilder(
        column: $table.grossAmount,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get fee =>
      $composableBuilder(column: $table.fee, builder: (column) => column);

  GeneratedColumnWithTypeConverter<FixedDecimal, String> get settlementAmount =>
      $composableBuilder(
        column: $table.settlementAmount,
        builder: (column) => column,
      );

  GeneratedColumn<int> get executedAtMicros => $composableBuilder(
    column: $table.executedAtMicros,
    builder: (column) => column,
  );

  $$LocalOrdersTableAnnotationComposer get orderId {
    final $$LocalOrdersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.localOrders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalOrdersTableAnnotationComposer(
            $db: $db,
            $table: $db.localOrders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TradeExecutionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TradeExecutionsTable,
          TradeExecutionRow,
          $$TradeExecutionsTableFilterComposer,
          $$TradeExecutionsTableOrderingComposer,
          $$TradeExecutionsTableAnnotationComposer,
          $$TradeExecutionsTableCreateCompanionBuilder,
          $$TradeExecutionsTableUpdateCompanionBuilder,
          (TradeExecutionRow, $$TradeExecutionsTableReferences),
          TradeExecutionRow,
          PrefetchHooks Function({bool orderId})
        > {
  $$TradeExecutionsTableTableManager(
    _$AppDatabase db,
    $TradeExecutionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TradeExecutionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TradeExecutionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TradeExecutionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> orderId = const Value.absent(),
                Value<String> liquidityRole = const Value.absent(),
                Value<FixedDecimal> price = const Value.absent(),
                Value<FixedDecimal> quantity = const Value.absent(),
                Value<FixedDecimal> grossAmount = const Value.absent(),
                Value<FixedDecimal> fee = const Value.absent(),
                Value<FixedDecimal> settlementAmount = const Value.absent(),
                Value<int> executedAtMicros = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TradeExecutionsCompanion(
                id: id,
                orderId: orderId,
                liquidityRole: liquidityRole,
                price: price,
                quantity: quantity,
                grossAmount: grossAmount,
                fee: fee,
                settlementAmount: settlementAmount,
                executedAtMicros: executedAtMicros,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String orderId,
                required String liquidityRole,
                required FixedDecimal price,
                required FixedDecimal quantity,
                required FixedDecimal grossAmount,
                required FixedDecimal fee,
                required FixedDecimal settlementAmount,
                required int executedAtMicros,
                Value<int> rowid = const Value.absent(),
              }) => TradeExecutionsCompanion.insert(
                id: id,
                orderId: orderId,
                liquidityRole: liquidityRole,
                price: price,
                quantity: quantity,
                grossAmount: grossAmount,
                fee: fee,
                settlementAmount: settlementAmount,
                executedAtMicros: executedAtMicros,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TradeExecutionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({orderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (orderId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.orderId,
                                referencedTable:
                                    $$TradeExecutionsTableReferences
                                        ._orderIdTable(db),
                                referencedColumn:
                                    $$TradeExecutionsTableReferences
                                        ._orderIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TradeExecutionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TradeExecutionsTable,
      TradeExecutionRow,
      $$TradeExecutionsTableFilterComposer,
      $$TradeExecutionsTableOrderingComposer,
      $$TradeExecutionsTableAnnotationComposer,
      $$TradeExecutionsTableCreateCompanionBuilder,
      $$TradeExecutionsTableUpdateCompanionBuilder,
      (TradeExecutionRow, $$TradeExecutionsTableReferences),
      TradeExecutionRow,
      PrefetchHooks Function({bool orderId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppInstallationsTableTableManager get appInstallations =>
      $$AppInstallationsTableTableManager(_db, _db.appInstallations);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$JpyBalancesTableTableManager get jpyBalances =>
      $$JpyBalancesTableTableManager(_db, _db.jpyBalances);
  $$AssetPositionsTableTableManager get assetPositions =>
      $$AssetPositionsTableTableManager(_db, _db.assetPositions);
  $$LocalOrdersTableTableManager get localOrders =>
      $$LocalOrdersTableTableManager(_db, _db.localOrders);
  $$TradeExecutionsTableTableManager get tradeExecutions =>
      $$TradeExecutionsTableTableManager(_db, _db.tradeExecutions);
}
