// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PendataanEntriesTable extends PendataanEntries
    with TableInfo<$PendataanEntriesTable, PendataanEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendataanEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titikPengamatanMeta = const VerificationMeta(
    'titikPengamatan',
  );
  @override
  late final GeneratedColumn<String> titikPengamatan = GeneratedColumn<String>(
    'titik_pengamatan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tanggalPengamatanMeta = const VerificationMeta(
    'tanggalPengamatan',
  );
  @override
  late final GeneratedColumn<DateTime> tanggalPengamatan =
      GeneratedColumn<DateTime>(
        'tanggal_pengamatan',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _gpsAccuracyMeterMeta = const VerificationMeta(
    'gpsAccuracyMeter',
  );
  @override
  late final GeneratedColumn<double> gpsAccuracyMeter = GeneratedColumn<double>(
    'gps_accuracy_meter',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _koordinatBelumLengkapMeta =
      const VerificationMeta('koordinatBelumLengkap');
  @override
  late final GeneratedColumn<bool> koordinatBelumLengkap =
      GeneratedColumn<bool>(
        'koordinat_belum_lengkap',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("koordinat_belum_lengkap" IN (0, 1))',
        ),
        defaultValue: const Constant(false),
      );
  static const VerificationMeta _ketinggianMdplMeta = const VerificationMeta(
    'ketinggianMdpl',
  );
  @override
  late final GeneratedColumn<double> ketinggianMdpl = GeneratedColumn<double>(
    'ketinggian_mdpl',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _elevasiApiMeterMeta = const VerificationMeta(
    'elevasiApiMeter',
  );
  @override
  late final GeneratedColumn<double> elevasiApiMeter = GeneratedColumn<double>(
    'elevasi_api_meter',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _spesiesMeta = const VerificationMeta(
    'spesies',
  );
  @override
  late final GeneratedColumn<String> spesies = GeneratedColumn<String>(
    'spesies',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _panjangKantongCmMeta = const VerificationMeta(
    'panjangKantongCm',
  );
  @override
  late final GeneratedColumn<double> panjangKantongCm = GeneratedColumn<double>(
    'panjang_kantong_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _diameterKantongCmMeta = const VerificationMeta(
    'diameterKantongCm',
  );
  @override
  late final GeneratedColumn<double> diameterKantongCm =
      GeneratedColumn<double>(
        'diameter_kantong_cm',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _tinggiTanamanCmMeta = const VerificationMeta(
    'tinggiTanamanCm',
  );
  @override
  late final GeneratedColumn<double> tinggiTanamanCm = GeneratedColumn<double>(
    'tinggi_tanaman_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _panjangDaunCmMeta = const VerificationMeta(
    'panjangDaunCm',
  );
  @override
  late final GeneratedColumn<double> panjangDaunCm = GeneratedColumn<double>(
    'panjang_daun_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _warnaKantongMeta = const VerificationMeta(
    'warnaKantong',
  );
  @override
  late final GeneratedColumn<String> warnaKantong = GeneratedColumn<String>(
    'warna_kantong',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _jumlahIndividuMeta = const VerificationMeta(
    'jumlahIndividu',
  );
  @override
  late final GeneratedColumn<int> jumlahIndividu = GeneratedColumn<int>(
    'jumlah_individu',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phTanahMeta = const VerificationMeta(
    'phTanah',
  );
  @override
  late final GeneratedColumn<double> phTanah = GeneratedColumn<double>(
    'ph_tanah',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kelembapanTanahPersenMeta =
      const VerificationMeta('kelembapanTanahPersen');
  @override
  late final GeneratedColumn<double> kelembapanTanahPersen =
      GeneratedColumn<double>(
        'kelembapan_tanah_persen',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _kelembapanUdaraPersenMeta =
      const VerificationMeta('kelembapanUdaraPersen');
  @override
  late final GeneratedColumn<double> kelembapanUdaraPersen =
      GeneratedColumn<double>(
        'kelembapan_udara_persen',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _suhuUdaraCelsiusMeta = const VerificationMeta(
    'suhuUdaraCelsius',
  );
  @override
  late final GeneratedColumn<double> suhuUdaraCelsius = GeneratedColumn<double>(
    'suhu_udara_celsius',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deskripsiHabitatMeta = const VerificationMeta(
    'deskripsiHabitat',
  );
  @override
  late final GeneratedColumn<String> deskripsiHabitat = GeneratedColumn<String>(
    'deskripsi_habitat',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _firestoreIdMeta = const VerificationMeta(
    'firestoreId',
  );
  @override
  late final GeneratedColumn<String> firestoreId = GeneratedColumn<String>(
    'firestore_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    titikPengamatan,
    tanggalPengamatan,
    latitude,
    longitude,
    gpsAccuracyMeter,
    koordinatBelumLengkap,
    ketinggianMdpl,
    elevasiApiMeter,
    spesies,
    panjangKantongCm,
    diameterKantongCm,
    tinggiTanamanCm,
    panjangDaunCm,
    warnaKantong,
    jumlahIndividu,
    phTanah,
    kelembapanTanahPersen,
    kelembapanUdaraPersen,
    suhuUdaraCelsius,
    deskripsiHabitat,
    createdAt,
    updatedAt,
    syncStatus,
    firestoreId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pendataan_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendataanEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('titik_pengamatan')) {
      context.handle(
        _titikPengamatanMeta,
        titikPengamatan.isAcceptableOrUnknown(
          data['titik_pengamatan']!,
          _titikPengamatanMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_titikPengamatanMeta);
    }
    if (data.containsKey('tanggal_pengamatan')) {
      context.handle(
        _tanggalPengamatanMeta,
        tanggalPengamatan.isAcceptableOrUnknown(
          data['tanggal_pengamatan']!,
          _tanggalPengamatanMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tanggalPengamatanMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    }
    if (data.containsKey('gps_accuracy_meter')) {
      context.handle(
        _gpsAccuracyMeterMeta,
        gpsAccuracyMeter.isAcceptableOrUnknown(
          data['gps_accuracy_meter']!,
          _gpsAccuracyMeterMeta,
        ),
      );
    }
    if (data.containsKey('koordinat_belum_lengkap')) {
      context.handle(
        _koordinatBelumLengkapMeta,
        koordinatBelumLengkap.isAcceptableOrUnknown(
          data['koordinat_belum_lengkap']!,
          _koordinatBelumLengkapMeta,
        ),
      );
    }
    if (data.containsKey('ketinggian_mdpl')) {
      context.handle(
        _ketinggianMdplMeta,
        ketinggianMdpl.isAcceptableOrUnknown(
          data['ketinggian_mdpl']!,
          _ketinggianMdplMeta,
        ),
      );
    }
    if (data.containsKey('elevasi_api_meter')) {
      context.handle(
        _elevasiApiMeterMeta,
        elevasiApiMeter.isAcceptableOrUnknown(
          data['elevasi_api_meter']!,
          _elevasiApiMeterMeta,
        ),
      );
    }
    if (data.containsKey('spesies')) {
      context.handle(
        _spesiesMeta,
        spesies.isAcceptableOrUnknown(data['spesies']!, _spesiesMeta),
      );
    }
    if (data.containsKey('panjang_kantong_cm')) {
      context.handle(
        _panjangKantongCmMeta,
        panjangKantongCm.isAcceptableOrUnknown(
          data['panjang_kantong_cm']!,
          _panjangKantongCmMeta,
        ),
      );
    }
    if (data.containsKey('diameter_kantong_cm')) {
      context.handle(
        _diameterKantongCmMeta,
        diameterKantongCm.isAcceptableOrUnknown(
          data['diameter_kantong_cm']!,
          _diameterKantongCmMeta,
        ),
      );
    }
    if (data.containsKey('tinggi_tanaman_cm')) {
      context.handle(
        _tinggiTanamanCmMeta,
        tinggiTanamanCm.isAcceptableOrUnknown(
          data['tinggi_tanaman_cm']!,
          _tinggiTanamanCmMeta,
        ),
      );
    }
    if (data.containsKey('panjang_daun_cm')) {
      context.handle(
        _panjangDaunCmMeta,
        panjangDaunCm.isAcceptableOrUnknown(
          data['panjang_daun_cm']!,
          _panjangDaunCmMeta,
        ),
      );
    }
    if (data.containsKey('warna_kantong')) {
      context.handle(
        _warnaKantongMeta,
        warnaKantong.isAcceptableOrUnknown(
          data['warna_kantong']!,
          _warnaKantongMeta,
        ),
      );
    }
    if (data.containsKey('jumlah_individu')) {
      context.handle(
        _jumlahIndividuMeta,
        jumlahIndividu.isAcceptableOrUnknown(
          data['jumlah_individu']!,
          _jumlahIndividuMeta,
        ),
      );
    }
    if (data.containsKey('ph_tanah')) {
      context.handle(
        _phTanahMeta,
        phTanah.isAcceptableOrUnknown(data['ph_tanah']!, _phTanahMeta),
      );
    }
    if (data.containsKey('kelembapan_tanah_persen')) {
      context.handle(
        _kelembapanTanahPersenMeta,
        kelembapanTanahPersen.isAcceptableOrUnknown(
          data['kelembapan_tanah_persen']!,
          _kelembapanTanahPersenMeta,
        ),
      );
    }
    if (data.containsKey('kelembapan_udara_persen')) {
      context.handle(
        _kelembapanUdaraPersenMeta,
        kelembapanUdaraPersen.isAcceptableOrUnknown(
          data['kelembapan_udara_persen']!,
          _kelembapanUdaraPersenMeta,
        ),
      );
    }
    if (data.containsKey('suhu_udara_celsius')) {
      context.handle(
        _suhuUdaraCelsiusMeta,
        suhuUdaraCelsius.isAcceptableOrUnknown(
          data['suhu_udara_celsius']!,
          _suhuUdaraCelsiusMeta,
        ),
      );
    }
    if (data.containsKey('deskripsi_habitat')) {
      context.handle(
        _deskripsiHabitatMeta,
        deskripsiHabitat.isAcceptableOrUnknown(
          data['deskripsi_habitat']!,
          _deskripsiHabitatMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('firestore_id')) {
      context.handle(
        _firestoreIdMeta,
        firestoreId.isAcceptableOrUnknown(
          data['firestore_id']!,
          _firestoreIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendataanEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendataanEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      titikPengamatan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titik_pengamatan'],
      )!,
      tanggalPengamatan: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tanggal_pengamatan'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      ),
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      ),
      gpsAccuracyMeter: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gps_accuracy_meter'],
      ),
      koordinatBelumLengkap: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}koordinat_belum_lengkap'],
      )!,
      ketinggianMdpl: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ketinggian_mdpl'],
      ),
      elevasiApiMeter: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}elevasi_api_meter'],
      ),
      spesies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}spesies'],
      ),
      panjangKantongCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}panjang_kantong_cm'],
      ),
      diameterKantongCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}diameter_kantong_cm'],
      ),
      tinggiTanamanCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tinggi_tanaman_cm'],
      ),
      panjangDaunCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}panjang_daun_cm'],
      ),
      warnaKantong: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}warna_kantong'],
      ),
      jumlahIndividu: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jumlah_individu'],
      ),
      phTanah: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ph_tanah'],
      ),
      kelembapanTanahPersen: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}kelembapan_tanah_persen'],
      ),
      kelembapanUdaraPersen: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}kelembapan_udara_persen'],
      ),
      suhuUdaraCelsius: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}suhu_udara_celsius'],
      ),
      deskripsiHabitat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deskripsi_habitat'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      firestoreId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firestore_id'],
      ),
    );
  }

  @override
  $PendataanEntriesTable createAlias(String alias) {
    return $PendataanEntriesTable(attachedDatabase, alias);
  }
}

class PendataanEntry extends DataClass implements Insertable<PendataanEntry> {
  final int id;
  final String titikPengamatan;
  final DateTime tanggalPengamatan;
  final double? latitude;
  final double? longitude;
  final double? gpsAccuracyMeter;
  final bool koordinatBelumLengkap;
  final double? ketinggianMdpl;
  final double? elevasiApiMeter;
  final String? spesies;
  final double? panjangKantongCm;
  final double? diameterKantongCm;
  final double? tinggiTanamanCm;
  final double? panjangDaunCm;
  final String? warnaKantong;
  final int? jumlahIndividu;
  final double? phTanah;
  final double? kelembapanTanahPersen;
  final double? kelembapanUdaraPersen;
  final double? suhuUdaraCelsius;
  final String? deskripsiHabitat;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncStatus;
  final String? firestoreId;
  const PendataanEntry({
    required this.id,
    required this.titikPengamatan,
    required this.tanggalPengamatan,
    this.latitude,
    this.longitude,
    this.gpsAccuracyMeter,
    required this.koordinatBelumLengkap,
    this.ketinggianMdpl,
    this.elevasiApiMeter,
    this.spesies,
    this.panjangKantongCm,
    this.diameterKantongCm,
    this.tinggiTanamanCm,
    this.panjangDaunCm,
    this.warnaKantong,
    this.jumlahIndividu,
    this.phTanah,
    this.kelembapanTanahPersen,
    this.kelembapanUdaraPersen,
    this.suhuUdaraCelsius,
    this.deskripsiHabitat,
    required this.createdAt,
    required this.updatedAt,
    required this.syncStatus,
    this.firestoreId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['titik_pengamatan'] = Variable<String>(titikPengamatan);
    map['tanggal_pengamatan'] = Variable<DateTime>(tanggalPengamatan);
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || gpsAccuracyMeter != null) {
      map['gps_accuracy_meter'] = Variable<double>(gpsAccuracyMeter);
    }
    map['koordinat_belum_lengkap'] = Variable<bool>(koordinatBelumLengkap);
    if (!nullToAbsent || ketinggianMdpl != null) {
      map['ketinggian_mdpl'] = Variable<double>(ketinggianMdpl);
    }
    if (!nullToAbsent || elevasiApiMeter != null) {
      map['elevasi_api_meter'] = Variable<double>(elevasiApiMeter);
    }
    if (!nullToAbsent || spesies != null) {
      map['spesies'] = Variable<String>(spesies);
    }
    if (!nullToAbsent || panjangKantongCm != null) {
      map['panjang_kantong_cm'] = Variable<double>(panjangKantongCm);
    }
    if (!nullToAbsent || diameterKantongCm != null) {
      map['diameter_kantong_cm'] = Variable<double>(diameterKantongCm);
    }
    if (!nullToAbsent || tinggiTanamanCm != null) {
      map['tinggi_tanaman_cm'] = Variable<double>(tinggiTanamanCm);
    }
    if (!nullToAbsent || panjangDaunCm != null) {
      map['panjang_daun_cm'] = Variable<double>(panjangDaunCm);
    }
    if (!nullToAbsent || warnaKantong != null) {
      map['warna_kantong'] = Variable<String>(warnaKantong);
    }
    if (!nullToAbsent || jumlahIndividu != null) {
      map['jumlah_individu'] = Variable<int>(jumlahIndividu);
    }
    if (!nullToAbsent || phTanah != null) {
      map['ph_tanah'] = Variable<double>(phTanah);
    }
    if (!nullToAbsent || kelembapanTanahPersen != null) {
      map['kelembapan_tanah_persen'] = Variable<double>(kelembapanTanahPersen);
    }
    if (!nullToAbsent || kelembapanUdaraPersen != null) {
      map['kelembapan_udara_persen'] = Variable<double>(kelembapanUdaraPersen);
    }
    if (!nullToAbsent || suhuUdaraCelsius != null) {
      map['suhu_udara_celsius'] = Variable<double>(suhuUdaraCelsius);
    }
    if (!nullToAbsent || deskripsiHabitat != null) {
      map['deskripsi_habitat'] = Variable<String>(deskripsiHabitat);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || firestoreId != null) {
      map['firestore_id'] = Variable<String>(firestoreId);
    }
    return map;
  }

  PendataanEntriesCompanion toCompanion(bool nullToAbsent) {
    return PendataanEntriesCompanion(
      id: Value(id),
      titikPengamatan: Value(titikPengamatan),
      tanggalPengamatan: Value(tanggalPengamatan),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      gpsAccuracyMeter: gpsAccuracyMeter == null && nullToAbsent
          ? const Value.absent()
          : Value(gpsAccuracyMeter),
      koordinatBelumLengkap: Value(koordinatBelumLengkap),
      ketinggianMdpl: ketinggianMdpl == null && nullToAbsent
          ? const Value.absent()
          : Value(ketinggianMdpl),
      elevasiApiMeter: elevasiApiMeter == null && nullToAbsent
          ? const Value.absent()
          : Value(elevasiApiMeter),
      spesies: spesies == null && nullToAbsent
          ? const Value.absent()
          : Value(spesies),
      panjangKantongCm: panjangKantongCm == null && nullToAbsent
          ? const Value.absent()
          : Value(panjangKantongCm),
      diameterKantongCm: diameterKantongCm == null && nullToAbsent
          ? const Value.absent()
          : Value(diameterKantongCm),
      tinggiTanamanCm: tinggiTanamanCm == null && nullToAbsent
          ? const Value.absent()
          : Value(tinggiTanamanCm),
      panjangDaunCm: panjangDaunCm == null && nullToAbsent
          ? const Value.absent()
          : Value(panjangDaunCm),
      warnaKantong: warnaKantong == null && nullToAbsent
          ? const Value.absent()
          : Value(warnaKantong),
      jumlahIndividu: jumlahIndividu == null && nullToAbsent
          ? const Value.absent()
          : Value(jumlahIndividu),
      phTanah: phTanah == null && nullToAbsent
          ? const Value.absent()
          : Value(phTanah),
      kelembapanTanahPersen: kelembapanTanahPersen == null && nullToAbsent
          ? const Value.absent()
          : Value(kelembapanTanahPersen),
      kelembapanUdaraPersen: kelembapanUdaraPersen == null && nullToAbsent
          ? const Value.absent()
          : Value(kelembapanUdaraPersen),
      suhuUdaraCelsius: suhuUdaraCelsius == null && nullToAbsent
          ? const Value.absent()
          : Value(suhuUdaraCelsius),
      deskripsiHabitat: deskripsiHabitat == null && nullToAbsent
          ? const Value.absent()
          : Value(deskripsiHabitat),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
      firestoreId: firestoreId == null && nullToAbsent
          ? const Value.absent()
          : Value(firestoreId),
    );
  }

  factory PendataanEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendataanEntry(
      id: serializer.fromJson<int>(json['id']),
      titikPengamatan: serializer.fromJson<String>(json['titikPengamatan']),
      tanggalPengamatan: serializer.fromJson<DateTime>(
        json['tanggalPengamatan'],
      ),
      latitude: serializer.fromJson<double?>(json['latitude']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      gpsAccuracyMeter: serializer.fromJson<double?>(json['gpsAccuracyMeter']),
      koordinatBelumLengkap: serializer.fromJson<bool>(
        json['koordinatBelumLengkap'],
      ),
      ketinggianMdpl: serializer.fromJson<double?>(json['ketinggianMdpl']),
      elevasiApiMeter: serializer.fromJson<double?>(json['elevasiApiMeter']),
      spesies: serializer.fromJson<String?>(json['spesies']),
      panjangKantongCm: serializer.fromJson<double?>(json['panjangKantongCm']),
      diameterKantongCm: serializer.fromJson<double?>(
        json['diameterKantongCm'],
      ),
      tinggiTanamanCm: serializer.fromJson<double?>(json['tinggiTanamanCm']),
      panjangDaunCm: serializer.fromJson<double?>(json['panjangDaunCm']),
      warnaKantong: serializer.fromJson<String?>(json['warnaKantong']),
      jumlahIndividu: serializer.fromJson<int?>(json['jumlahIndividu']),
      phTanah: serializer.fromJson<double?>(json['phTanah']),
      kelembapanTanahPersen: serializer.fromJson<double?>(
        json['kelembapanTanahPersen'],
      ),
      kelembapanUdaraPersen: serializer.fromJson<double?>(
        json['kelembapanUdaraPersen'],
      ),
      suhuUdaraCelsius: serializer.fromJson<double?>(json['suhuUdaraCelsius']),
      deskripsiHabitat: serializer.fromJson<String?>(json['deskripsiHabitat']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      firestoreId: serializer.fromJson<String?>(json['firestoreId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'titikPengamatan': serializer.toJson<String>(titikPengamatan),
      'tanggalPengamatan': serializer.toJson<DateTime>(tanggalPengamatan),
      'latitude': serializer.toJson<double?>(latitude),
      'longitude': serializer.toJson<double?>(longitude),
      'gpsAccuracyMeter': serializer.toJson<double?>(gpsAccuracyMeter),
      'koordinatBelumLengkap': serializer.toJson<bool>(koordinatBelumLengkap),
      'ketinggianMdpl': serializer.toJson<double?>(ketinggianMdpl),
      'elevasiApiMeter': serializer.toJson<double?>(elevasiApiMeter),
      'spesies': serializer.toJson<String?>(spesies),
      'panjangKantongCm': serializer.toJson<double?>(panjangKantongCm),
      'diameterKantongCm': serializer.toJson<double?>(diameterKantongCm),
      'tinggiTanamanCm': serializer.toJson<double?>(tinggiTanamanCm),
      'panjangDaunCm': serializer.toJson<double?>(panjangDaunCm),
      'warnaKantong': serializer.toJson<String?>(warnaKantong),
      'jumlahIndividu': serializer.toJson<int?>(jumlahIndividu),
      'phTanah': serializer.toJson<double?>(phTanah),
      'kelembapanTanahPersen': serializer.toJson<double?>(
        kelembapanTanahPersen,
      ),
      'kelembapanUdaraPersen': serializer.toJson<double?>(
        kelembapanUdaraPersen,
      ),
      'suhuUdaraCelsius': serializer.toJson<double?>(suhuUdaraCelsius),
      'deskripsiHabitat': serializer.toJson<String?>(deskripsiHabitat),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'firestoreId': serializer.toJson<String?>(firestoreId),
    };
  }

  PendataanEntry copyWith({
    int? id,
    String? titikPengamatan,
    DateTime? tanggalPengamatan,
    Value<double?> latitude = const Value.absent(),
    Value<double?> longitude = const Value.absent(),
    Value<double?> gpsAccuracyMeter = const Value.absent(),
    bool? koordinatBelumLengkap,
    Value<double?> ketinggianMdpl = const Value.absent(),
    Value<double?> elevasiApiMeter = const Value.absent(),
    Value<String?> spesies = const Value.absent(),
    Value<double?> panjangKantongCm = const Value.absent(),
    Value<double?> diameterKantongCm = const Value.absent(),
    Value<double?> tinggiTanamanCm = const Value.absent(),
    Value<double?> panjangDaunCm = const Value.absent(),
    Value<String?> warnaKantong = const Value.absent(),
    Value<int?> jumlahIndividu = const Value.absent(),
    Value<double?> phTanah = const Value.absent(),
    Value<double?> kelembapanTanahPersen = const Value.absent(),
    Value<double?> kelembapanUdaraPersen = const Value.absent(),
    Value<double?> suhuUdaraCelsius = const Value.absent(),
    Value<String?> deskripsiHabitat = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    String? syncStatus,
    Value<String?> firestoreId = const Value.absent(),
  }) => PendataanEntry(
    id: id ?? this.id,
    titikPengamatan: titikPengamatan ?? this.titikPengamatan,
    tanggalPengamatan: tanggalPengamatan ?? this.tanggalPengamatan,
    latitude: latitude.present ? latitude.value : this.latitude,
    longitude: longitude.present ? longitude.value : this.longitude,
    gpsAccuracyMeter: gpsAccuracyMeter.present
        ? gpsAccuracyMeter.value
        : this.gpsAccuracyMeter,
    koordinatBelumLengkap: koordinatBelumLengkap ?? this.koordinatBelumLengkap,
    ketinggianMdpl: ketinggianMdpl.present
        ? ketinggianMdpl.value
        : this.ketinggianMdpl,
    elevasiApiMeter: elevasiApiMeter.present
        ? elevasiApiMeter.value
        : this.elevasiApiMeter,
    spesies: spesies.present ? spesies.value : this.spesies,
    panjangKantongCm: panjangKantongCm.present
        ? panjangKantongCm.value
        : this.panjangKantongCm,
    diameterKantongCm: diameterKantongCm.present
        ? diameterKantongCm.value
        : this.diameterKantongCm,
    tinggiTanamanCm: tinggiTanamanCm.present
        ? tinggiTanamanCm.value
        : this.tinggiTanamanCm,
    panjangDaunCm: panjangDaunCm.present
        ? panjangDaunCm.value
        : this.panjangDaunCm,
    warnaKantong: warnaKantong.present ? warnaKantong.value : this.warnaKantong,
    jumlahIndividu: jumlahIndividu.present
        ? jumlahIndividu.value
        : this.jumlahIndividu,
    phTanah: phTanah.present ? phTanah.value : this.phTanah,
    kelembapanTanahPersen: kelembapanTanahPersen.present
        ? kelembapanTanahPersen.value
        : this.kelembapanTanahPersen,
    kelembapanUdaraPersen: kelembapanUdaraPersen.present
        ? kelembapanUdaraPersen.value
        : this.kelembapanUdaraPersen,
    suhuUdaraCelsius: suhuUdaraCelsius.present
        ? suhuUdaraCelsius.value
        : this.suhuUdaraCelsius,
    deskripsiHabitat: deskripsiHabitat.present
        ? deskripsiHabitat.value
        : this.deskripsiHabitat,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    firestoreId: firestoreId.present ? firestoreId.value : this.firestoreId,
  );
  PendataanEntry copyWithCompanion(PendataanEntriesCompanion data) {
    return PendataanEntry(
      id: data.id.present ? data.id.value : this.id,
      titikPengamatan: data.titikPengamatan.present
          ? data.titikPengamatan.value
          : this.titikPengamatan,
      tanggalPengamatan: data.tanggalPengamatan.present
          ? data.tanggalPengamatan.value
          : this.tanggalPengamatan,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      gpsAccuracyMeter: data.gpsAccuracyMeter.present
          ? data.gpsAccuracyMeter.value
          : this.gpsAccuracyMeter,
      koordinatBelumLengkap: data.koordinatBelumLengkap.present
          ? data.koordinatBelumLengkap.value
          : this.koordinatBelumLengkap,
      ketinggianMdpl: data.ketinggianMdpl.present
          ? data.ketinggianMdpl.value
          : this.ketinggianMdpl,
      elevasiApiMeter: data.elevasiApiMeter.present
          ? data.elevasiApiMeter.value
          : this.elevasiApiMeter,
      spesies: data.spesies.present ? data.spesies.value : this.spesies,
      panjangKantongCm: data.panjangKantongCm.present
          ? data.panjangKantongCm.value
          : this.panjangKantongCm,
      diameterKantongCm: data.diameterKantongCm.present
          ? data.diameterKantongCm.value
          : this.diameterKantongCm,
      tinggiTanamanCm: data.tinggiTanamanCm.present
          ? data.tinggiTanamanCm.value
          : this.tinggiTanamanCm,
      panjangDaunCm: data.panjangDaunCm.present
          ? data.panjangDaunCm.value
          : this.panjangDaunCm,
      warnaKantong: data.warnaKantong.present
          ? data.warnaKantong.value
          : this.warnaKantong,
      jumlahIndividu: data.jumlahIndividu.present
          ? data.jumlahIndividu.value
          : this.jumlahIndividu,
      phTanah: data.phTanah.present ? data.phTanah.value : this.phTanah,
      kelembapanTanahPersen: data.kelembapanTanahPersen.present
          ? data.kelembapanTanahPersen.value
          : this.kelembapanTanahPersen,
      kelembapanUdaraPersen: data.kelembapanUdaraPersen.present
          ? data.kelembapanUdaraPersen.value
          : this.kelembapanUdaraPersen,
      suhuUdaraCelsius: data.suhuUdaraCelsius.present
          ? data.suhuUdaraCelsius.value
          : this.suhuUdaraCelsius,
      deskripsiHabitat: data.deskripsiHabitat.present
          ? data.deskripsiHabitat.value
          : this.deskripsiHabitat,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      firestoreId: data.firestoreId.present
          ? data.firestoreId.value
          : this.firestoreId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendataanEntry(')
          ..write('id: $id, ')
          ..write('titikPengamatan: $titikPengamatan, ')
          ..write('tanggalPengamatan: $tanggalPengamatan, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('gpsAccuracyMeter: $gpsAccuracyMeter, ')
          ..write('koordinatBelumLengkap: $koordinatBelumLengkap, ')
          ..write('ketinggianMdpl: $ketinggianMdpl, ')
          ..write('elevasiApiMeter: $elevasiApiMeter, ')
          ..write('spesies: $spesies, ')
          ..write('panjangKantongCm: $panjangKantongCm, ')
          ..write('diameterKantongCm: $diameterKantongCm, ')
          ..write('tinggiTanamanCm: $tinggiTanamanCm, ')
          ..write('panjangDaunCm: $panjangDaunCm, ')
          ..write('warnaKantong: $warnaKantong, ')
          ..write('jumlahIndividu: $jumlahIndividu, ')
          ..write('phTanah: $phTanah, ')
          ..write('kelembapanTanahPersen: $kelembapanTanahPersen, ')
          ..write('kelembapanUdaraPersen: $kelembapanUdaraPersen, ')
          ..write('suhuUdaraCelsius: $suhuUdaraCelsius, ')
          ..write('deskripsiHabitat: $deskripsiHabitat, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('firestoreId: $firestoreId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    titikPengamatan,
    tanggalPengamatan,
    latitude,
    longitude,
    gpsAccuracyMeter,
    koordinatBelumLengkap,
    ketinggianMdpl,
    elevasiApiMeter,
    spesies,
    panjangKantongCm,
    diameterKantongCm,
    tinggiTanamanCm,
    panjangDaunCm,
    warnaKantong,
    jumlahIndividu,
    phTanah,
    kelembapanTanahPersen,
    kelembapanUdaraPersen,
    suhuUdaraCelsius,
    deskripsiHabitat,
    createdAt,
    updatedAt,
    syncStatus,
    firestoreId,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendataanEntry &&
          other.id == this.id &&
          other.titikPengamatan == this.titikPengamatan &&
          other.tanggalPengamatan == this.tanggalPengamatan &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.gpsAccuracyMeter == this.gpsAccuracyMeter &&
          other.koordinatBelumLengkap == this.koordinatBelumLengkap &&
          other.ketinggianMdpl == this.ketinggianMdpl &&
          other.elevasiApiMeter == this.elevasiApiMeter &&
          other.spesies == this.spesies &&
          other.panjangKantongCm == this.panjangKantongCm &&
          other.diameterKantongCm == this.diameterKantongCm &&
          other.tinggiTanamanCm == this.tinggiTanamanCm &&
          other.panjangDaunCm == this.panjangDaunCm &&
          other.warnaKantong == this.warnaKantong &&
          other.jumlahIndividu == this.jumlahIndividu &&
          other.phTanah == this.phTanah &&
          other.kelembapanTanahPersen == this.kelembapanTanahPersen &&
          other.kelembapanUdaraPersen == this.kelembapanUdaraPersen &&
          other.suhuUdaraCelsius == this.suhuUdaraCelsius &&
          other.deskripsiHabitat == this.deskripsiHabitat &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus &&
          other.firestoreId == this.firestoreId);
}

class PendataanEntriesCompanion extends UpdateCompanion<PendataanEntry> {
  final Value<int> id;
  final Value<String> titikPengamatan;
  final Value<DateTime> tanggalPengamatan;
  final Value<double?> latitude;
  final Value<double?> longitude;
  final Value<double?> gpsAccuracyMeter;
  final Value<bool> koordinatBelumLengkap;
  final Value<double?> ketinggianMdpl;
  final Value<double?> elevasiApiMeter;
  final Value<String?> spesies;
  final Value<double?> panjangKantongCm;
  final Value<double?> diameterKantongCm;
  final Value<double?> tinggiTanamanCm;
  final Value<double?> panjangDaunCm;
  final Value<String?> warnaKantong;
  final Value<int?> jumlahIndividu;
  final Value<double?> phTanah;
  final Value<double?> kelembapanTanahPersen;
  final Value<double?> kelembapanUdaraPersen;
  final Value<double?> suhuUdaraCelsius;
  final Value<String?> deskripsiHabitat;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  final Value<String?> firestoreId;
  const PendataanEntriesCompanion({
    this.id = const Value.absent(),
    this.titikPengamatan = const Value.absent(),
    this.tanggalPengamatan = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.gpsAccuracyMeter = const Value.absent(),
    this.koordinatBelumLengkap = const Value.absent(),
    this.ketinggianMdpl = const Value.absent(),
    this.elevasiApiMeter = const Value.absent(),
    this.spesies = const Value.absent(),
    this.panjangKantongCm = const Value.absent(),
    this.diameterKantongCm = const Value.absent(),
    this.tinggiTanamanCm = const Value.absent(),
    this.panjangDaunCm = const Value.absent(),
    this.warnaKantong = const Value.absent(),
    this.jumlahIndividu = const Value.absent(),
    this.phTanah = const Value.absent(),
    this.kelembapanTanahPersen = const Value.absent(),
    this.kelembapanUdaraPersen = const Value.absent(),
    this.suhuUdaraCelsius = const Value.absent(),
    this.deskripsiHabitat = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.firestoreId = const Value.absent(),
  });
  PendataanEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String titikPengamatan,
    required DateTime tanggalPengamatan,
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.gpsAccuracyMeter = const Value.absent(),
    this.koordinatBelumLengkap = const Value.absent(),
    this.ketinggianMdpl = const Value.absent(),
    this.elevasiApiMeter = const Value.absent(),
    this.spesies = const Value.absent(),
    this.panjangKantongCm = const Value.absent(),
    this.diameterKantongCm = const Value.absent(),
    this.tinggiTanamanCm = const Value.absent(),
    this.panjangDaunCm = const Value.absent(),
    this.warnaKantong = const Value.absent(),
    this.jumlahIndividu = const Value.absent(),
    this.phTanah = const Value.absent(),
    this.kelembapanTanahPersen = const Value.absent(),
    this.kelembapanUdaraPersen = const Value.absent(),
    this.suhuUdaraCelsius = const Value.absent(),
    this.deskripsiHabitat = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.firestoreId = const Value.absent(),
  }) : titikPengamatan = Value(titikPengamatan),
       tanggalPengamatan = Value(tanggalPengamatan);
  static Insertable<PendataanEntry> custom({
    Expression<int>? id,
    Expression<String>? titikPengamatan,
    Expression<DateTime>? tanggalPengamatan,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? gpsAccuracyMeter,
    Expression<bool>? koordinatBelumLengkap,
    Expression<double>? ketinggianMdpl,
    Expression<double>? elevasiApiMeter,
    Expression<String>? spesies,
    Expression<double>? panjangKantongCm,
    Expression<double>? diameterKantongCm,
    Expression<double>? tinggiTanamanCm,
    Expression<double>? panjangDaunCm,
    Expression<String>? warnaKantong,
    Expression<int>? jumlahIndividu,
    Expression<double>? phTanah,
    Expression<double>? kelembapanTanahPersen,
    Expression<double>? kelembapanUdaraPersen,
    Expression<double>? suhuUdaraCelsius,
    Expression<String>? deskripsiHabitat,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
    Expression<String>? firestoreId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titikPengamatan != null) 'titik_pengamatan': titikPengamatan,
      if (tanggalPengamatan != null) 'tanggal_pengamatan': tanggalPengamatan,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (gpsAccuracyMeter != null) 'gps_accuracy_meter': gpsAccuracyMeter,
      if (koordinatBelumLengkap != null)
        'koordinat_belum_lengkap': koordinatBelumLengkap,
      if (ketinggianMdpl != null) 'ketinggian_mdpl': ketinggianMdpl,
      if (elevasiApiMeter != null) 'elevasi_api_meter': elevasiApiMeter,
      if (spesies != null) 'spesies': spesies,
      if (panjangKantongCm != null) 'panjang_kantong_cm': panjangKantongCm,
      if (diameterKantongCm != null) 'diameter_kantong_cm': diameterKantongCm,
      if (tinggiTanamanCm != null) 'tinggi_tanaman_cm': tinggiTanamanCm,
      if (panjangDaunCm != null) 'panjang_daun_cm': panjangDaunCm,
      if (warnaKantong != null) 'warna_kantong': warnaKantong,
      if (jumlahIndividu != null) 'jumlah_individu': jumlahIndividu,
      if (phTanah != null) 'ph_tanah': phTanah,
      if (kelembapanTanahPersen != null)
        'kelembapan_tanah_persen': kelembapanTanahPersen,
      if (kelembapanUdaraPersen != null)
        'kelembapan_udara_persen': kelembapanUdaraPersen,
      if (suhuUdaraCelsius != null) 'suhu_udara_celsius': suhuUdaraCelsius,
      if (deskripsiHabitat != null) 'deskripsi_habitat': deskripsiHabitat,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (firestoreId != null) 'firestore_id': firestoreId,
    });
  }

  PendataanEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? titikPengamatan,
    Value<DateTime>? tanggalPengamatan,
    Value<double?>? latitude,
    Value<double?>? longitude,
    Value<double?>? gpsAccuracyMeter,
    Value<bool>? koordinatBelumLengkap,
    Value<double?>? ketinggianMdpl,
    Value<double?>? elevasiApiMeter,
    Value<String?>? spesies,
    Value<double?>? panjangKantongCm,
    Value<double?>? diameterKantongCm,
    Value<double?>? tinggiTanamanCm,
    Value<double?>? panjangDaunCm,
    Value<String?>? warnaKantong,
    Value<int?>? jumlahIndividu,
    Value<double?>? phTanah,
    Value<double?>? kelembapanTanahPersen,
    Value<double?>? kelembapanUdaraPersen,
    Value<double?>? suhuUdaraCelsius,
    Value<String?>? deskripsiHabitat,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? syncStatus,
    Value<String?>? firestoreId,
  }) {
    return PendataanEntriesCompanion(
      id: id ?? this.id,
      titikPengamatan: titikPengamatan ?? this.titikPengamatan,
      tanggalPengamatan: tanggalPengamatan ?? this.tanggalPengamatan,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      gpsAccuracyMeter: gpsAccuracyMeter ?? this.gpsAccuracyMeter,
      koordinatBelumLengkap:
          koordinatBelumLengkap ?? this.koordinatBelumLengkap,
      ketinggianMdpl: ketinggianMdpl ?? this.ketinggianMdpl,
      elevasiApiMeter: elevasiApiMeter ?? this.elevasiApiMeter,
      spesies: spesies ?? this.spesies,
      panjangKantongCm: panjangKantongCm ?? this.panjangKantongCm,
      diameterKantongCm: diameterKantongCm ?? this.diameterKantongCm,
      tinggiTanamanCm: tinggiTanamanCm ?? this.tinggiTanamanCm,
      panjangDaunCm: panjangDaunCm ?? this.panjangDaunCm,
      warnaKantong: warnaKantong ?? this.warnaKantong,
      jumlahIndividu: jumlahIndividu ?? this.jumlahIndividu,
      phTanah: phTanah ?? this.phTanah,
      kelembapanTanahPersen:
          kelembapanTanahPersen ?? this.kelembapanTanahPersen,
      kelembapanUdaraPersen:
          kelembapanUdaraPersen ?? this.kelembapanUdaraPersen,
      suhuUdaraCelsius: suhuUdaraCelsius ?? this.suhuUdaraCelsius,
      deskripsiHabitat: deskripsiHabitat ?? this.deskripsiHabitat,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      firestoreId: firestoreId ?? this.firestoreId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (titikPengamatan.present) {
      map['titik_pengamatan'] = Variable<String>(titikPengamatan.value);
    }
    if (tanggalPengamatan.present) {
      map['tanggal_pengamatan'] = Variable<DateTime>(tanggalPengamatan.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (gpsAccuracyMeter.present) {
      map['gps_accuracy_meter'] = Variable<double>(gpsAccuracyMeter.value);
    }
    if (koordinatBelumLengkap.present) {
      map['koordinat_belum_lengkap'] = Variable<bool>(
        koordinatBelumLengkap.value,
      );
    }
    if (ketinggianMdpl.present) {
      map['ketinggian_mdpl'] = Variable<double>(ketinggianMdpl.value);
    }
    if (elevasiApiMeter.present) {
      map['elevasi_api_meter'] = Variable<double>(elevasiApiMeter.value);
    }
    if (spesies.present) {
      map['spesies'] = Variable<String>(spesies.value);
    }
    if (panjangKantongCm.present) {
      map['panjang_kantong_cm'] = Variable<double>(panjangKantongCm.value);
    }
    if (diameterKantongCm.present) {
      map['diameter_kantong_cm'] = Variable<double>(diameterKantongCm.value);
    }
    if (tinggiTanamanCm.present) {
      map['tinggi_tanaman_cm'] = Variable<double>(tinggiTanamanCm.value);
    }
    if (panjangDaunCm.present) {
      map['panjang_daun_cm'] = Variable<double>(panjangDaunCm.value);
    }
    if (warnaKantong.present) {
      map['warna_kantong'] = Variable<String>(warnaKantong.value);
    }
    if (jumlahIndividu.present) {
      map['jumlah_individu'] = Variable<int>(jumlahIndividu.value);
    }
    if (phTanah.present) {
      map['ph_tanah'] = Variable<double>(phTanah.value);
    }
    if (kelembapanTanahPersen.present) {
      map['kelembapan_tanah_persen'] = Variable<double>(
        kelembapanTanahPersen.value,
      );
    }
    if (kelembapanUdaraPersen.present) {
      map['kelembapan_udara_persen'] = Variable<double>(
        kelembapanUdaraPersen.value,
      );
    }
    if (suhuUdaraCelsius.present) {
      map['suhu_udara_celsius'] = Variable<double>(suhuUdaraCelsius.value);
    }
    if (deskripsiHabitat.present) {
      map['deskripsi_habitat'] = Variable<String>(deskripsiHabitat.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (firestoreId.present) {
      map['firestore_id'] = Variable<String>(firestoreId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendataanEntriesCompanion(')
          ..write('id: $id, ')
          ..write('titikPengamatan: $titikPengamatan, ')
          ..write('tanggalPengamatan: $tanggalPengamatan, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('gpsAccuracyMeter: $gpsAccuracyMeter, ')
          ..write('koordinatBelumLengkap: $koordinatBelumLengkap, ')
          ..write('ketinggianMdpl: $ketinggianMdpl, ')
          ..write('elevasiApiMeter: $elevasiApiMeter, ')
          ..write('spesies: $spesies, ')
          ..write('panjangKantongCm: $panjangKantongCm, ')
          ..write('diameterKantongCm: $diameterKantongCm, ')
          ..write('tinggiTanamanCm: $tinggiTanamanCm, ')
          ..write('panjangDaunCm: $panjangDaunCm, ')
          ..write('warnaKantong: $warnaKantong, ')
          ..write('jumlahIndividu: $jumlahIndividu, ')
          ..write('phTanah: $phTanah, ')
          ..write('kelembapanTanahPersen: $kelembapanTanahPersen, ')
          ..write('kelembapanUdaraPersen: $kelembapanUdaraPersen, ')
          ..write('suhuUdaraCelsius: $suhuUdaraCelsius, ')
          ..write('deskripsiHabitat: $deskripsiHabitat, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('firestoreId: $firestoreId')
          ..write(')'))
        .toString();
  }
}

class $PendataanPhotosTable extends PendataanPhotos
    with TableInfo<$PendataanPhotosTable, PendataanPhoto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendataanPhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _entryIdMeta = const VerificationMeta(
    'entryId',
  );
  @override
  late final GeneratedColumn<int> entryId = GeneratedColumn<int>(
    'entry_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pendataan_entries (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jenisFotoMeta = const VerificationMeta(
    'jenisFoto',
  );
  @override
  late final GeneratedColumn<String> jenisFoto = GeneratedColumn<String>(
    'jenis_foto',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _uploadedUrlMeta = const VerificationMeta(
    'uploadedUrl',
  );
  @override
  late final GeneratedColumn<String> uploadedUrl = GeneratedColumn<String>(
    'uploaded_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    entryId,
    localPath,
    jenisFoto,
    uploadedUrl,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pendataan_photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendataanPhoto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entry_id')) {
      context.handle(
        _entryIdMeta,
        entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('jenis_foto')) {
      context.handle(
        _jenisFotoMeta,
        jenisFoto.isAcceptableOrUnknown(data['jenis_foto']!, _jenisFotoMeta),
      );
    } else if (isInserting) {
      context.missing(_jenisFotoMeta);
    }
    if (data.containsKey('uploaded_url')) {
      context.handle(
        _uploadedUrlMeta,
        uploadedUrl.isAcceptableOrUnknown(
          data['uploaded_url']!,
          _uploadedUrlMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendataanPhoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendataanPhoto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entry_id'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      jenisFoto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}jenis_foto'],
      )!,
      uploadedUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uploaded_url'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PendataanPhotosTable createAlias(String alias) {
    return $PendataanPhotosTable(attachedDatabase, alias);
  }
}

class PendataanPhoto extends DataClass implements Insertable<PendataanPhoto> {
  final int id;
  final int entryId;
  final String localPath;
  final String jenisFoto;
  final String? uploadedUrl;
  final DateTime createdAt;
  const PendataanPhoto({
    required this.id,
    required this.entryId,
    required this.localPath,
    required this.jenisFoto,
    this.uploadedUrl,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entry_id'] = Variable<int>(entryId);
    map['local_path'] = Variable<String>(localPath);
    map['jenis_foto'] = Variable<String>(jenisFoto);
    if (!nullToAbsent || uploadedUrl != null) {
      map['uploaded_url'] = Variable<String>(uploadedUrl);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PendataanPhotosCompanion toCompanion(bool nullToAbsent) {
    return PendataanPhotosCompanion(
      id: Value(id),
      entryId: Value(entryId),
      localPath: Value(localPath),
      jenisFoto: Value(jenisFoto),
      uploadedUrl: uploadedUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(uploadedUrl),
      createdAt: Value(createdAt),
    );
  }

  factory PendataanPhoto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendataanPhoto(
      id: serializer.fromJson<int>(json['id']),
      entryId: serializer.fromJson<int>(json['entryId']),
      localPath: serializer.fromJson<String>(json['localPath']),
      jenisFoto: serializer.fromJson<String>(json['jenisFoto']),
      uploadedUrl: serializer.fromJson<String?>(json['uploadedUrl']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entryId': serializer.toJson<int>(entryId),
      'localPath': serializer.toJson<String>(localPath),
      'jenisFoto': serializer.toJson<String>(jenisFoto),
      'uploadedUrl': serializer.toJson<String?>(uploadedUrl),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PendataanPhoto copyWith({
    int? id,
    int? entryId,
    String? localPath,
    String? jenisFoto,
    Value<String?> uploadedUrl = const Value.absent(),
    DateTime? createdAt,
  }) => PendataanPhoto(
    id: id ?? this.id,
    entryId: entryId ?? this.entryId,
    localPath: localPath ?? this.localPath,
    jenisFoto: jenisFoto ?? this.jenisFoto,
    uploadedUrl: uploadedUrl.present ? uploadedUrl.value : this.uploadedUrl,
    createdAt: createdAt ?? this.createdAt,
  );
  PendataanPhoto copyWithCompanion(PendataanPhotosCompanion data) {
    return PendataanPhoto(
      id: data.id.present ? data.id.value : this.id,
      entryId: data.entryId.present ? data.entryId.value : this.entryId,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      jenisFoto: data.jenisFoto.present ? data.jenisFoto.value : this.jenisFoto,
      uploadedUrl: data.uploadedUrl.present
          ? data.uploadedUrl.value
          : this.uploadedUrl,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendataanPhoto(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('localPath: $localPath, ')
          ..write('jenisFoto: $jenisFoto, ')
          ..write('uploadedUrl: $uploadedUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, entryId, localPath, jenisFoto, uploadedUrl, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendataanPhoto &&
          other.id == this.id &&
          other.entryId == this.entryId &&
          other.localPath == this.localPath &&
          other.jenisFoto == this.jenisFoto &&
          other.uploadedUrl == this.uploadedUrl &&
          other.createdAt == this.createdAt);
}

class PendataanPhotosCompanion extends UpdateCompanion<PendataanPhoto> {
  final Value<int> id;
  final Value<int> entryId;
  final Value<String> localPath;
  final Value<String> jenisFoto;
  final Value<String?> uploadedUrl;
  final Value<DateTime> createdAt;
  const PendataanPhotosCompanion({
    this.id = const Value.absent(),
    this.entryId = const Value.absent(),
    this.localPath = const Value.absent(),
    this.jenisFoto = const Value.absent(),
    this.uploadedUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PendataanPhotosCompanion.insert({
    this.id = const Value.absent(),
    required int entryId,
    required String localPath,
    required String jenisFoto,
    this.uploadedUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : entryId = Value(entryId),
       localPath = Value(localPath),
       jenisFoto = Value(jenisFoto);
  static Insertable<PendataanPhoto> custom({
    Expression<int>? id,
    Expression<int>? entryId,
    Expression<String>? localPath,
    Expression<String>? jenisFoto,
    Expression<String>? uploadedUrl,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entryId != null) 'entry_id': entryId,
      if (localPath != null) 'local_path': localPath,
      if (jenisFoto != null) 'jenis_foto': jenisFoto,
      if (uploadedUrl != null) 'uploaded_url': uploadedUrl,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PendataanPhotosCompanion copyWith({
    Value<int>? id,
    Value<int>? entryId,
    Value<String>? localPath,
    Value<String>? jenisFoto,
    Value<String?>? uploadedUrl,
    Value<DateTime>? createdAt,
  }) {
    return PendataanPhotosCompanion(
      id: id ?? this.id,
      entryId: entryId ?? this.entryId,
      localPath: localPath ?? this.localPath,
      jenisFoto: jenisFoto ?? this.jenisFoto,
      uploadedUrl: uploadedUrl ?? this.uploadedUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (jenisFoto.present) {
      map['jenis_foto'] = Variable<String>(jenisFoto.value);
    }
    if (uploadedUrl.present) {
      map['uploaded_url'] = Variable<String>(uploadedUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendataanPhotosCompanion(')
          ..write('id: $id, ')
          ..write('entryId: $entryId, ')
          ..write('localPath: $localPath, ')
          ..write('jenisFoto: $jenisFoto, ')
          ..write('uploadedUrl: $uploadedUrl, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarLocalPathMeta = const VerificationMeta(
    'avatarLocalPath',
  );
  @override
  late final GeneratedColumn<String> avatarLocalPath = GeneratedColumn<String>(
    'avatar_local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _avatarRemoteUrlMeta = const VerificationMeta(
    'avatarRemoteUrl',
  );
  @override
  late final GeneratedColumn<String> avatarRemoteUrl = GeneratedColumn<String>(
    'avatar_remote_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    displayName,
    phoneNumber,
    avatarLocalPath,
    avatarRemoteUrl,
    syncStatus,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    }
    if (data.containsKey('avatar_local_path')) {
      context.handle(
        _avatarLocalPathMeta,
        avatarLocalPath.isAcceptableOrUnknown(
          data['avatar_local_path']!,
          _avatarLocalPathMeta,
        ),
      );
    }
    if (data.containsKey('avatar_remote_url')) {
      context.handle(
        _avatarRemoteUrlMeta,
        avatarRemoteUrl.isAcceptableOrUnknown(
          data['avatar_remote_url']!,
          _avatarRemoteUrlMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      ),
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
      avatarLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar_local_path'],
      ),
      avatarRemoteUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}avatar_remote_url'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final int id;
  final String? displayName;
  final String? phoneNumber;
  final String? avatarLocalPath;
  final String? avatarRemoteUrl;
  final String syncStatus;
  final DateTime updatedAt;
  const UserProfile({
    required this.id,
    this.displayName,
    this.phoneNumber,
    this.avatarLocalPath,
    this.avatarRemoteUrl,
    required this.syncStatus,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || displayName != null) {
      map['display_name'] = Variable<String>(displayName);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || avatarLocalPath != null) {
      map['avatar_local_path'] = Variable<String>(avatarLocalPath);
    }
    if (!nullToAbsent || avatarRemoteUrl != null) {
      map['avatar_remote_url'] = Variable<String>(avatarRemoteUrl);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      avatarLocalPath: avatarLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarLocalPath),
      avatarRemoteUrl: avatarRemoteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarRemoteUrl),
      syncStatus: Value(syncStatus),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<int>(json['id']),
      displayName: serializer.fromJson<String?>(json['displayName']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      avatarLocalPath: serializer.fromJson<String?>(json['avatarLocalPath']),
      avatarRemoteUrl: serializer.fromJson<String?>(json['avatarRemoteUrl']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'displayName': serializer.toJson<String?>(displayName),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'avatarLocalPath': serializer.toJson<String?>(avatarLocalPath),
      'avatarRemoteUrl': serializer.toJson<String?>(avatarRemoteUrl),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserProfile copyWith({
    int? id,
    Value<String?> displayName = const Value.absent(),
    Value<String?> phoneNumber = const Value.absent(),
    Value<String?> avatarLocalPath = const Value.absent(),
    Value<String?> avatarRemoteUrl = const Value.absent(),
    String? syncStatus,
    DateTime? updatedAt,
  }) => UserProfile(
    id: id ?? this.id,
    displayName: displayName.present ? displayName.value : this.displayName,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    avatarLocalPath: avatarLocalPath.present
        ? avatarLocalPath.value
        : this.avatarLocalPath,
    avatarRemoteUrl: avatarRemoteUrl.present
        ? avatarRemoteUrl.value
        : this.avatarRemoteUrl,
    syncStatus: syncStatus ?? this.syncStatus,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      avatarLocalPath: data.avatarLocalPath.present
          ? data.avatarLocalPath.value
          : this.avatarLocalPath,
      avatarRemoteUrl: data.avatarRemoteUrl.present
          ? data.avatarRemoteUrl.value
          : this.avatarRemoteUrl,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('avatarLocalPath: $avatarLocalPath, ')
          ..write('avatarRemoteUrl: $avatarRemoteUrl, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    displayName,
    phoneNumber,
    avatarLocalPath,
    avatarRemoteUrl,
    syncStatus,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.phoneNumber == this.phoneNumber &&
          other.avatarLocalPath == this.avatarLocalPath &&
          other.avatarRemoteUrl == this.avatarRemoteUrl &&
          other.syncStatus == this.syncStatus &&
          other.updatedAt == this.updatedAt);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<int> id;
  final Value<String?> displayName;
  final Value<String?> phoneNumber;
  final Value<String?> avatarLocalPath;
  final Value<String?> avatarRemoteUrl;
  final Value<String> syncStatus;
  final Value<DateTime> updatedAt;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.avatarLocalPath = const Value.absent(),
    this.avatarRemoteUrl = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.avatarLocalPath = const Value.absent(),
    this.avatarRemoteUrl = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<UserProfile> custom({
    Expression<int>? id,
    Expression<String>? displayName,
    Expression<String>? phoneNumber,
    Expression<String>? avatarLocalPath,
    Expression<String>? avatarRemoteUrl,
    Expression<String>? syncStatus,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (avatarLocalPath != null) 'avatar_local_path': avatarLocalPath,
      if (avatarRemoteUrl != null) 'avatar_remote_url': avatarRemoteUrl,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserProfilesCompanion copyWith({
    Value<int>? id,
    Value<String?>? displayName,
    Value<String?>? phoneNumber,
    Value<String?>? avatarLocalPath,
    Value<String?>? avatarRemoteUrl,
    Value<String>? syncStatus,
    Value<DateTime>? updatedAt,
  }) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarLocalPath: avatarLocalPath ?? this.avatarLocalPath,
      avatarRemoteUrl: avatarRemoteUrl ?? this.avatarRemoteUrl,
      syncStatus: syncStatus ?? this.syncStatus,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (avatarLocalPath.present) {
      map['avatar_local_path'] = Variable<String>(avatarLocalPath.value);
    }
    if (avatarRemoteUrl.present) {
      map['avatar_remote_url'] = Variable<String>(avatarRemoteUrl.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('avatarLocalPath: $avatarLocalPath, ')
          ..write('avatarRemoteUrl: $avatarRemoteUrl, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PendataanEntriesTable pendataanEntries = $PendataanEntriesTable(
    this,
  );
  late final $PendataanPhotosTable pendataanPhotos = $PendataanPhotosTable(
    this,
  );
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final PendataanDao pendataanDao = PendataanDao(this as AppDatabase);
  late final UserProfileDao userProfileDao = UserProfileDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    pendataanEntries,
    pendataanPhotos,
    userProfiles,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'pendataan_entries',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('pendataan_photos', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$PendataanEntriesTableCreateCompanionBuilder =
    PendataanEntriesCompanion Function({
      Value<int> id,
      required String titikPengamatan,
      required DateTime tanggalPengamatan,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<double?> gpsAccuracyMeter,
      Value<bool> koordinatBelumLengkap,
      Value<double?> ketinggianMdpl,
      Value<double?> elevasiApiMeter,
      Value<String?> spesies,
      Value<double?> panjangKantongCm,
      Value<double?> diameterKantongCm,
      Value<double?> tinggiTanamanCm,
      Value<double?> panjangDaunCm,
      Value<String?> warnaKantong,
      Value<int?> jumlahIndividu,
      Value<double?> phTanah,
      Value<double?> kelembapanTanahPersen,
      Value<double?> kelembapanUdaraPersen,
      Value<double?> suhuUdaraCelsius,
      Value<String?> deskripsiHabitat,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
      Value<String?> firestoreId,
    });
typedef $$PendataanEntriesTableUpdateCompanionBuilder =
    PendataanEntriesCompanion Function({
      Value<int> id,
      Value<String> titikPengamatan,
      Value<DateTime> tanggalPengamatan,
      Value<double?> latitude,
      Value<double?> longitude,
      Value<double?> gpsAccuracyMeter,
      Value<bool> koordinatBelumLengkap,
      Value<double?> ketinggianMdpl,
      Value<double?> elevasiApiMeter,
      Value<String?> spesies,
      Value<double?> panjangKantongCm,
      Value<double?> diameterKantongCm,
      Value<double?> tinggiTanamanCm,
      Value<double?> panjangDaunCm,
      Value<String?> warnaKantong,
      Value<int?> jumlahIndividu,
      Value<double?> phTanah,
      Value<double?> kelembapanTanahPersen,
      Value<double?> kelembapanUdaraPersen,
      Value<double?> suhuUdaraCelsius,
      Value<String?> deskripsiHabitat,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> syncStatus,
      Value<String?> firestoreId,
    });

final class $$PendataanEntriesTableReferences
    extends
        BaseReferences<_$AppDatabase, $PendataanEntriesTable, PendataanEntry> {
  $$PendataanEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$PendataanPhotosTable, List<PendataanPhoto>>
  _pendataanPhotosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.pendataanPhotos,
    aliasName: $_aliasNameGenerator(
      db.pendataanEntries.id,
      db.pendataanPhotos.entryId,
    ),
  );

  $$PendataanPhotosTableProcessedTableManager get pendataanPhotosRefs {
    final manager = $$PendataanPhotosTableTableManager(
      $_db,
      $_db.pendataanPhotos,
    ).filter((f) => f.entryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _pendataanPhotosRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PendataanEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $PendataanEntriesTable> {
  $$PendataanEntriesTableFilterComposer({
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

  ColumnFilters<String> get titikPengamatan => $composableBuilder(
    column: $table.titikPengamatan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tanggalPengamatan => $composableBuilder(
    column: $table.tanggalPengamatan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gpsAccuracyMeter => $composableBuilder(
    column: $table.gpsAccuracyMeter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get koordinatBelumLengkap => $composableBuilder(
    column: $table.koordinatBelumLengkap,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ketinggianMdpl => $composableBuilder(
    column: $table.ketinggianMdpl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get elevasiApiMeter => $composableBuilder(
    column: $table.elevasiApiMeter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get spesies => $composableBuilder(
    column: $table.spesies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get panjangKantongCm => $composableBuilder(
    column: $table.panjangKantongCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get diameterKantongCm => $composableBuilder(
    column: $table.diameterKantongCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get tinggiTanamanCm => $composableBuilder(
    column: $table.tinggiTanamanCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get panjangDaunCm => $composableBuilder(
    column: $table.panjangDaunCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get warnaKantong => $composableBuilder(
    column: $table.warnaKantong,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jumlahIndividu => $composableBuilder(
    column: $table.jumlahIndividu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get phTanah => $composableBuilder(
    column: $table.phTanah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get kelembapanTanahPersen => $composableBuilder(
    column: $table.kelembapanTanahPersen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get kelembapanUdaraPersen => $composableBuilder(
    column: $table.kelembapanUdaraPersen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get suhuUdaraCelsius => $composableBuilder(
    column: $table.suhuUdaraCelsius,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deskripsiHabitat => $composableBuilder(
    column: $table.deskripsiHabitat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firestoreId => $composableBuilder(
    column: $table.firestoreId,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> pendataanPhotosRefs(
    Expression<bool> Function($$PendataanPhotosTableFilterComposer f) f,
  ) {
    final $$PendataanPhotosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pendataanPhotos,
      getReferencedColumn: (t) => t.entryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PendataanPhotosTableFilterComposer(
            $db: $db,
            $table: $db.pendataanPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PendataanEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $PendataanEntriesTable> {
  $$PendataanEntriesTableOrderingComposer({
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

  ColumnOrderings<String> get titikPengamatan => $composableBuilder(
    column: $table.titikPengamatan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tanggalPengamatan => $composableBuilder(
    column: $table.tanggalPengamatan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gpsAccuracyMeter => $composableBuilder(
    column: $table.gpsAccuracyMeter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get koordinatBelumLengkap => $composableBuilder(
    column: $table.koordinatBelumLengkap,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ketinggianMdpl => $composableBuilder(
    column: $table.ketinggianMdpl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get elevasiApiMeter => $composableBuilder(
    column: $table.elevasiApiMeter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get spesies => $composableBuilder(
    column: $table.spesies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get panjangKantongCm => $composableBuilder(
    column: $table.panjangKantongCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get diameterKantongCm => $composableBuilder(
    column: $table.diameterKantongCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get tinggiTanamanCm => $composableBuilder(
    column: $table.tinggiTanamanCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get panjangDaunCm => $composableBuilder(
    column: $table.panjangDaunCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get warnaKantong => $composableBuilder(
    column: $table.warnaKantong,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jumlahIndividu => $composableBuilder(
    column: $table.jumlahIndividu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get phTanah => $composableBuilder(
    column: $table.phTanah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get kelembapanTanahPersen => $composableBuilder(
    column: $table.kelembapanTanahPersen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get kelembapanUdaraPersen => $composableBuilder(
    column: $table.kelembapanUdaraPersen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get suhuUdaraCelsius => $composableBuilder(
    column: $table.suhuUdaraCelsius,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deskripsiHabitat => $composableBuilder(
    column: $table.deskripsiHabitat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firestoreId => $composableBuilder(
    column: $table.firestoreId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendataanEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendataanEntriesTable> {
  $$PendataanEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get titikPengamatan => $composableBuilder(
    column: $table.titikPengamatan,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get tanggalPengamatan => $composableBuilder(
    column: $table.tanggalPengamatan,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get gpsAccuracyMeter => $composableBuilder(
    column: $table.gpsAccuracyMeter,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get koordinatBelumLengkap => $composableBuilder(
    column: $table.koordinatBelumLengkap,
    builder: (column) => column,
  );

  GeneratedColumn<double> get ketinggianMdpl => $composableBuilder(
    column: $table.ketinggianMdpl,
    builder: (column) => column,
  );

  GeneratedColumn<double> get elevasiApiMeter => $composableBuilder(
    column: $table.elevasiApiMeter,
    builder: (column) => column,
  );

  GeneratedColumn<String> get spesies =>
      $composableBuilder(column: $table.spesies, builder: (column) => column);

  GeneratedColumn<double> get panjangKantongCm => $composableBuilder(
    column: $table.panjangKantongCm,
    builder: (column) => column,
  );

  GeneratedColumn<double> get diameterKantongCm => $composableBuilder(
    column: $table.diameterKantongCm,
    builder: (column) => column,
  );

  GeneratedColumn<double> get tinggiTanamanCm => $composableBuilder(
    column: $table.tinggiTanamanCm,
    builder: (column) => column,
  );

  GeneratedColumn<double> get panjangDaunCm => $composableBuilder(
    column: $table.panjangDaunCm,
    builder: (column) => column,
  );

  GeneratedColumn<String> get warnaKantong => $composableBuilder(
    column: $table.warnaKantong,
    builder: (column) => column,
  );

  GeneratedColumn<int> get jumlahIndividu => $composableBuilder(
    column: $table.jumlahIndividu,
    builder: (column) => column,
  );

  GeneratedColumn<double> get phTanah =>
      $composableBuilder(column: $table.phTanah, builder: (column) => column);

  GeneratedColumn<double> get kelembapanTanahPersen => $composableBuilder(
    column: $table.kelembapanTanahPersen,
    builder: (column) => column,
  );

  GeneratedColumn<double> get kelembapanUdaraPersen => $composableBuilder(
    column: $table.kelembapanUdaraPersen,
    builder: (column) => column,
  );

  GeneratedColumn<double> get suhuUdaraCelsius => $composableBuilder(
    column: $table.suhuUdaraCelsius,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deskripsiHabitat => $composableBuilder(
    column: $table.deskripsiHabitat,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firestoreId => $composableBuilder(
    column: $table.firestoreId,
    builder: (column) => column,
  );

  Expression<T> pendataanPhotosRefs<T extends Object>(
    Expression<T> Function($$PendataanPhotosTableAnnotationComposer a) f,
  ) {
    final $$PendataanPhotosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pendataanPhotos,
      getReferencedColumn: (t) => t.entryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PendataanPhotosTableAnnotationComposer(
            $db: $db,
            $table: $db.pendataanPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PendataanEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendataanEntriesTable,
          PendataanEntry,
          $$PendataanEntriesTableFilterComposer,
          $$PendataanEntriesTableOrderingComposer,
          $$PendataanEntriesTableAnnotationComposer,
          $$PendataanEntriesTableCreateCompanionBuilder,
          $$PendataanEntriesTableUpdateCompanionBuilder,
          (PendataanEntry, $$PendataanEntriesTableReferences),
          PendataanEntry,
          PrefetchHooks Function({bool pendataanPhotosRefs})
        > {
  $$PendataanEntriesTableTableManager(
    _$AppDatabase db,
    $PendataanEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendataanEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendataanEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendataanEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> titikPengamatan = const Value.absent(),
                Value<DateTime> tanggalPengamatan = const Value.absent(),
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<double?> gpsAccuracyMeter = const Value.absent(),
                Value<bool> koordinatBelumLengkap = const Value.absent(),
                Value<double?> ketinggianMdpl = const Value.absent(),
                Value<double?> elevasiApiMeter = const Value.absent(),
                Value<String?> spesies = const Value.absent(),
                Value<double?> panjangKantongCm = const Value.absent(),
                Value<double?> diameterKantongCm = const Value.absent(),
                Value<double?> tinggiTanamanCm = const Value.absent(),
                Value<double?> panjangDaunCm = const Value.absent(),
                Value<String?> warnaKantong = const Value.absent(),
                Value<int?> jumlahIndividu = const Value.absent(),
                Value<double?> phTanah = const Value.absent(),
                Value<double?> kelembapanTanahPersen = const Value.absent(),
                Value<double?> kelembapanUdaraPersen = const Value.absent(),
                Value<double?> suhuUdaraCelsius = const Value.absent(),
                Value<String?> deskripsiHabitat = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> firestoreId = const Value.absent(),
              }) => PendataanEntriesCompanion(
                id: id,
                titikPengamatan: titikPengamatan,
                tanggalPengamatan: tanggalPengamatan,
                latitude: latitude,
                longitude: longitude,
                gpsAccuracyMeter: gpsAccuracyMeter,
                koordinatBelumLengkap: koordinatBelumLengkap,
                ketinggianMdpl: ketinggianMdpl,
                elevasiApiMeter: elevasiApiMeter,
                spesies: spesies,
                panjangKantongCm: panjangKantongCm,
                diameterKantongCm: diameterKantongCm,
                tinggiTanamanCm: tinggiTanamanCm,
                panjangDaunCm: panjangDaunCm,
                warnaKantong: warnaKantong,
                jumlahIndividu: jumlahIndividu,
                phTanah: phTanah,
                kelembapanTanahPersen: kelembapanTanahPersen,
                kelembapanUdaraPersen: kelembapanUdaraPersen,
                suhuUdaraCelsius: suhuUdaraCelsius,
                deskripsiHabitat: deskripsiHabitat,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
                firestoreId: firestoreId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String titikPengamatan,
                required DateTime tanggalPengamatan,
                Value<double?> latitude = const Value.absent(),
                Value<double?> longitude = const Value.absent(),
                Value<double?> gpsAccuracyMeter = const Value.absent(),
                Value<bool> koordinatBelumLengkap = const Value.absent(),
                Value<double?> ketinggianMdpl = const Value.absent(),
                Value<double?> elevasiApiMeter = const Value.absent(),
                Value<String?> spesies = const Value.absent(),
                Value<double?> panjangKantongCm = const Value.absent(),
                Value<double?> diameterKantongCm = const Value.absent(),
                Value<double?> tinggiTanamanCm = const Value.absent(),
                Value<double?> panjangDaunCm = const Value.absent(),
                Value<String?> warnaKantong = const Value.absent(),
                Value<int?> jumlahIndividu = const Value.absent(),
                Value<double?> phTanah = const Value.absent(),
                Value<double?> kelembapanTanahPersen = const Value.absent(),
                Value<double?> kelembapanUdaraPersen = const Value.absent(),
                Value<double?> suhuUdaraCelsius = const Value.absent(),
                Value<String?> deskripsiHabitat = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String?> firestoreId = const Value.absent(),
              }) => PendataanEntriesCompanion.insert(
                id: id,
                titikPengamatan: titikPengamatan,
                tanggalPengamatan: tanggalPengamatan,
                latitude: latitude,
                longitude: longitude,
                gpsAccuracyMeter: gpsAccuracyMeter,
                koordinatBelumLengkap: koordinatBelumLengkap,
                ketinggianMdpl: ketinggianMdpl,
                elevasiApiMeter: elevasiApiMeter,
                spesies: spesies,
                panjangKantongCm: panjangKantongCm,
                diameterKantongCm: diameterKantongCm,
                tinggiTanamanCm: tinggiTanamanCm,
                panjangDaunCm: panjangDaunCm,
                warnaKantong: warnaKantong,
                jumlahIndividu: jumlahIndividu,
                phTanah: phTanah,
                kelembapanTanahPersen: kelembapanTanahPersen,
                kelembapanUdaraPersen: kelembapanUdaraPersen,
                suhuUdaraCelsius: suhuUdaraCelsius,
                deskripsiHabitat: deskripsiHabitat,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
                firestoreId: firestoreId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PendataanEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pendataanPhotosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (pendataanPhotosRefs) db.pendataanPhotos,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pendataanPhotosRefs)
                    await $_getPrefetchedData<
                      PendataanEntry,
                      $PendataanEntriesTable,
                      PendataanPhoto
                    >(
                      currentTable: table,
                      referencedTable: $$PendataanEntriesTableReferences
                          ._pendataanPhotosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PendataanEntriesTableReferences(
                            db,
                            table,
                            p0,
                          ).pendataanPhotosRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.entryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PendataanEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendataanEntriesTable,
      PendataanEntry,
      $$PendataanEntriesTableFilterComposer,
      $$PendataanEntriesTableOrderingComposer,
      $$PendataanEntriesTableAnnotationComposer,
      $$PendataanEntriesTableCreateCompanionBuilder,
      $$PendataanEntriesTableUpdateCompanionBuilder,
      (PendataanEntry, $$PendataanEntriesTableReferences),
      PendataanEntry,
      PrefetchHooks Function({bool pendataanPhotosRefs})
    >;
typedef $$PendataanPhotosTableCreateCompanionBuilder =
    PendataanPhotosCompanion Function({
      Value<int> id,
      required int entryId,
      required String localPath,
      required String jenisFoto,
      Value<String?> uploadedUrl,
      Value<DateTime> createdAt,
    });
typedef $$PendataanPhotosTableUpdateCompanionBuilder =
    PendataanPhotosCompanion Function({
      Value<int> id,
      Value<int> entryId,
      Value<String> localPath,
      Value<String> jenisFoto,
      Value<String?> uploadedUrl,
      Value<DateTime> createdAt,
    });

final class $$PendataanPhotosTableReferences
    extends
        BaseReferences<_$AppDatabase, $PendataanPhotosTable, PendataanPhoto> {
  $$PendataanPhotosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PendataanEntriesTable _entryIdTable(_$AppDatabase db) =>
      db.pendataanEntries.createAlias(
        $_aliasNameGenerator(
          db.pendataanPhotos.entryId,
          db.pendataanEntries.id,
        ),
      );

  $$PendataanEntriesTableProcessedTableManager get entryId {
    final $_column = $_itemColumn<int>('entry_id')!;

    final manager = $$PendataanEntriesTableTableManager(
      $_db,
      $_db.pendataanEntries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_entryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PendataanPhotosTableFilterComposer
    extends Composer<_$AppDatabase, $PendataanPhotosTable> {
  $$PendataanPhotosTableFilterComposer({
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

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jenisFoto => $composableBuilder(
    column: $table.jenisFoto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get uploadedUrl => $composableBuilder(
    column: $table.uploadedUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PendataanEntriesTableFilterComposer get entryId {
    final $$PendataanEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.pendataanEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PendataanEntriesTableFilterComposer(
            $db: $db,
            $table: $db.pendataanEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PendataanPhotosTableOrderingComposer
    extends Composer<_$AppDatabase, $PendataanPhotosTable> {
  $$PendataanPhotosTableOrderingComposer({
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

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jenisFoto => $composableBuilder(
    column: $table.jenisFoto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get uploadedUrl => $composableBuilder(
    column: $table.uploadedUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PendataanEntriesTableOrderingComposer get entryId {
    final $$PendataanEntriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.pendataanEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PendataanEntriesTableOrderingComposer(
            $db: $db,
            $table: $db.pendataanEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PendataanPhotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendataanPhotosTable> {
  $$PendataanPhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get jenisFoto =>
      $composableBuilder(column: $table.jenisFoto, builder: (column) => column);

  GeneratedColumn<String> get uploadedUrl => $composableBuilder(
    column: $table.uploadedUrl,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PendataanEntriesTableAnnotationComposer get entryId {
    final $$PendataanEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.entryId,
      referencedTable: $db.pendataanEntries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PendataanEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.pendataanEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PendataanPhotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendataanPhotosTable,
          PendataanPhoto,
          $$PendataanPhotosTableFilterComposer,
          $$PendataanPhotosTableOrderingComposer,
          $$PendataanPhotosTableAnnotationComposer,
          $$PendataanPhotosTableCreateCompanionBuilder,
          $$PendataanPhotosTableUpdateCompanionBuilder,
          (PendataanPhoto, $$PendataanPhotosTableReferences),
          PendataanPhoto,
          PrefetchHooks Function({bool entryId})
        > {
  $$PendataanPhotosTableTableManager(
    _$AppDatabase db,
    $PendataanPhotosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendataanPhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendataanPhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendataanPhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> entryId = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<String> jenisFoto = const Value.absent(),
                Value<String?> uploadedUrl = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PendataanPhotosCompanion(
                id: id,
                entryId: entryId,
                localPath: localPath,
                jenisFoto: jenisFoto,
                uploadedUrl: uploadedUrl,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int entryId,
                required String localPath,
                required String jenisFoto,
                Value<String?> uploadedUrl = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PendataanPhotosCompanion.insert(
                id: id,
                entryId: entryId,
                localPath: localPath,
                jenisFoto: jenisFoto,
                uploadedUrl: uploadedUrl,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PendataanPhotosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({entryId = false}) {
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
                    if (entryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.entryId,
                                referencedTable:
                                    $$PendataanPhotosTableReferences
                                        ._entryIdTable(db),
                                referencedColumn:
                                    $$PendataanPhotosTableReferences
                                        ._entryIdTable(db)
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

typedef $$PendataanPhotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendataanPhotosTable,
      PendataanPhoto,
      $$PendataanPhotosTableFilterComposer,
      $$PendataanPhotosTableOrderingComposer,
      $$PendataanPhotosTableAnnotationComposer,
      $$PendataanPhotosTableCreateCompanionBuilder,
      $$PendataanPhotosTableUpdateCompanionBuilder,
      (PendataanPhoto, $$PendataanPhotosTableReferences),
      PendataanPhoto,
      PrefetchHooks Function({bool entryId})
    >;
typedef $$UserProfilesTableCreateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      Value<String?> displayName,
      Value<String?> phoneNumber,
      Value<String?> avatarLocalPath,
      Value<String?> avatarRemoteUrl,
      Value<String> syncStatus,
      Value<DateTime> updatedAt,
    });
typedef $$UserProfilesTableUpdateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      Value<String?> displayName,
      Value<String?> phoneNumber,
      Value<String?> avatarLocalPath,
      Value<String?> avatarRemoteUrl,
      Value<String> syncStatus,
      Value<DateTime> updatedAt,
    });

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
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

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatarLocalPath => $composableBuilder(
    column: $table.avatarLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get avatarRemoteUrl => $composableBuilder(
    column: $table.avatarRemoteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
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

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatarLocalPath => $composableBuilder(
    column: $table.avatarLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get avatarRemoteUrl => $composableBuilder(
    column: $table.avatarRemoteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get avatarLocalPath => $composableBuilder(
    column: $table.avatarLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get avatarRemoteUrl => $composableBuilder(
    column: $table.avatarRemoteUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTable,
          UserProfile,
          $$UserProfilesTableFilterComposer,
          $$UserProfilesTableOrderingComposer,
          $$UserProfilesTableAnnotationComposer,
          $$UserProfilesTableCreateCompanionBuilder,
          $$UserProfilesTableUpdateCompanionBuilder,
          (
            UserProfile,
            BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
          ),
          UserProfile,
          PrefetchHooks Function()
        > {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<String?> avatarLocalPath = const Value.absent(),
                Value<String?> avatarRemoteUrl = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserProfilesCompanion(
                id: id,
                displayName: displayName,
                phoneNumber: phoneNumber,
                avatarLocalPath: avatarLocalPath,
                avatarRemoteUrl: avatarRemoteUrl,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> displayName = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<String?> avatarLocalPath = const Value.absent(),
                Value<String?> avatarRemoteUrl = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserProfilesCompanion.insert(
                id: id,
                displayName: displayName,
                phoneNumber: phoneNumber,
                avatarLocalPath: avatarLocalPath,
                avatarRemoteUrl: avatarRemoteUrl,
                syncStatus: syncStatus,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTable,
      UserProfile,
      $$UserProfilesTableFilterComposer,
      $$UserProfilesTableOrderingComposer,
      $$UserProfilesTableAnnotationComposer,
      $$UserProfilesTableCreateCompanionBuilder,
      $$UserProfilesTableUpdateCompanionBuilder,
      (
        UserProfile,
        BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
      ),
      UserProfile,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PendataanEntriesTableTableManager get pendataanEntries =>
      $$PendataanEntriesTableTableManager(_db, _db.pendataanEntries);
  $$PendataanPhotosTableTableManager get pendataanPhotos =>
      $$PendataanPhotosTableTableManager(_db, _db.pendataanPhotos);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
}
