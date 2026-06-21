// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chucker_http_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChuckerHttpRecordCollection on Isar {
  IsarCollection<ChuckerHttpRecord> get chuckerHttpRecords => this.collection();
}

const ChuckerHttpRecordSchema = CollectionSchema(
  name: r'ChuckerHttpRecord',
  id: -2317506523036569802,
  properties: {
    r'contentType': PropertySchema(
      id: 0,
      name: r'contentType',
      type: IsarType.string,
    ),
    r'durationMs': PropertySchema(
      id: 1,
      name: r'durationMs',
      type: IsarType.long,
    ),
    r'endedAt': PropertySchema(
      id: 2,
      name: r'endedAt',
      type: IsarType.dateTime,
    ),
    r'error': PropertySchema(id: 3, name: r'error', type: IsarType.string),
    r'errorType': PropertySchema(
      id: 4,
      name: r'errorType',
      type: IsarType.string,
    ),
    r'hasError': PropertySchema(id: 5, name: r'hasError', type: IsarType.bool),
    r'host': PropertySchema(id: 6, name: r'host', type: IsarType.string),
    r'isCancelled': PropertySchema(
      id: 7,
      name: r'isCancelled',
      type: IsarType.bool,
    ),
    r'isSlow': PropertySchema(id: 8, name: r'isSlow', type: IsarType.bool),
    r'method': PropertySchema(id: 9, name: r'method', type: IsarType.string),
    r'path': PropertySchema(id: 10, name: r'path', type: IsarType.string),
    r'queryParametersJson': PropertySchema(
      id: 11,
      name: r'queryParametersJson',
      type: IsarType.string,
    ),
    r'requestBody': PropertySchema(
      id: 12,
      name: r'requestBody',
      type: IsarType.string,
    ),
    r'requestHeadersJson': PropertySchema(
      id: 13,
      name: r'requestHeadersJson',
      type: IsarType.string,
    ),
    r'requestSize': PropertySchema(
      id: 14,
      name: r'requestSize',
      type: IsarType.long,
    ),
    r'responseBody': PropertySchema(
      id: 15,
      name: r'responseBody',
      type: IsarType.string,
    ),
    r'responseHeadersJson': PropertySchema(
      id: 16,
      name: r'responseHeadersJson',
      type: IsarType.string,
    ),
    r'responseSize': PropertySchema(
      id: 17,
      name: r'responseSize',
      type: IsarType.long,
    ),
    r'searchableText': PropertySchema(
      id: 18,
      name: r'searchableText',
      type: IsarType.string,
    ),
    r'sessionId': PropertySchema(
      id: 19,
      name: r'sessionId',
      type: IsarType.string,
    ),
    r'source': PropertySchema(id: 20, name: r'source', type: IsarType.string),
    r'startedAt': PropertySchema(
      id: 21,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'statusCode': PropertySchema(
      id: 22,
      name: r'statusCode',
      type: IsarType.long,
    ),
    r'url': PropertySchema(id: 23, name: r'url', type: IsarType.string),
  },

  estimateSize: _chuckerHttpRecordEstimateSize,
  serialize: _chuckerHttpRecordSerialize,
  deserialize: _chuckerHttpRecordDeserialize,
  deserializeProp: _chuckerHttpRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'sessionId': IndexSchema(
      id: 6949518585047923839,
      name: r'sessionId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sessionId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'source': IndexSchema(
      id: -836881197531269605,
      name: r'source',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'source',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'method': IndexSchema(
      id: 8928465704037863407,
      name: r'method',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'method',
          type: IndexType.hash,
          caseSensitive: false,
        ),
      ],
    ),
    r'host': IndexSchema(
      id: -7602099240340412494,
      name: r'host',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'host',
          type: IndexType.hash,
          caseSensitive: false,
        ),
      ],
    ),
    r'path': IndexSchema(
      id: 8756705481922369689,
      name: r'path',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'path',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'searchableText': IndexSchema(
      id: -9046542787480971762,
      name: r'searchableText',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'searchableText',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'startedAt': IndexSchema(
      id: 8114395319341636597,
      name: r'startedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startedAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'endedAt': IndexSchema(
      id: 6537651538163225198,
      name: r'endedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'endedAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'durationMs': IndexSchema(
      id: -3632149205198405195,
      name: r'durationMs',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'durationMs',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'statusCode': IndexSchema(
      id: -6314811767148897591,
      name: r'statusCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'statusCode',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'hasError': IndexSchema(
      id: -5868282500943718196,
      name: r'hasError',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hasError',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'isCancelled': IndexSchema(
      id: 9046873824095663760,
      name: r'isCancelled',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isCancelled',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'isSlow': IndexSchema(
      id: 7431253141995887919,
      name: r'isSlow',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isSlow',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _chuckerHttpRecordGetId,
  getLinks: _chuckerHttpRecordGetLinks,
  attach: _chuckerHttpRecordAttach,
  version: '3.3.2',
);

int _chuckerHttpRecordEstimateSize(
  ChuckerHttpRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contentType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.error;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.errorType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.host.length * 3;
  bytesCount += 3 + object.method.length * 3;
  bytesCount += 3 + object.path.length * 3;
  bytesCount += 3 + object.queryParametersJson.length * 3;
  {
    final value = object.requestBody;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.requestHeadersJson.length * 3;
  {
    final value = object.responseBody;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.responseHeadersJson.length * 3;
  bytesCount += 3 + object.searchableText.length * 3;
  bytesCount += 3 + object.sessionId.length * 3;
  bytesCount += 3 + object.source.length * 3;
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _chuckerHttpRecordSerialize(
  ChuckerHttpRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.contentType);
  writer.writeLong(offsets[1], object.durationMs);
  writer.writeDateTime(offsets[2], object.endedAt);
  writer.writeString(offsets[3], object.error);
  writer.writeString(offsets[4], object.errorType);
  writer.writeBool(offsets[5], object.hasError);
  writer.writeString(offsets[6], object.host);
  writer.writeBool(offsets[7], object.isCancelled);
  writer.writeBool(offsets[8], object.isSlow);
  writer.writeString(offsets[9], object.method);
  writer.writeString(offsets[10], object.path);
  writer.writeString(offsets[11], object.queryParametersJson);
  writer.writeString(offsets[12], object.requestBody);
  writer.writeString(offsets[13], object.requestHeadersJson);
  writer.writeLong(offsets[14], object.requestSize);
  writer.writeString(offsets[15], object.responseBody);
  writer.writeString(offsets[16], object.responseHeadersJson);
  writer.writeLong(offsets[17], object.responseSize);
  writer.writeString(offsets[18], object.searchableText);
  writer.writeString(offsets[19], object.sessionId);
  writer.writeString(offsets[20], object.source);
  writer.writeDateTime(offsets[21], object.startedAt);
  writer.writeLong(offsets[22], object.statusCode);
  writer.writeString(offsets[23], object.url);
}

ChuckerHttpRecord _chuckerHttpRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChuckerHttpRecord(
    contentType: reader.readStringOrNull(offsets[0]),
    durationMs: reader.readLong(offsets[1]),
    endedAt: reader.readDateTime(offsets[2]),
    error: reader.readStringOrNull(offsets[3]),
    errorType: reader.readStringOrNull(offsets[4]),
    hasError: reader.readBool(offsets[5]),
    host: reader.readString(offsets[6]),
    id: id,
    isCancelled: reader.readBool(offsets[7]),
    isSlow: reader.readBool(offsets[8]),
    method: reader.readString(offsets[9]),
    path: reader.readString(offsets[10]),
    queryParametersJson: reader.readString(offsets[11]),
    requestBody: reader.readStringOrNull(offsets[12]),
    requestHeadersJson: reader.readString(offsets[13]),
    requestSize: reader.readLong(offsets[14]),
    responseBody: reader.readStringOrNull(offsets[15]),
    responseHeadersJson: reader.readString(offsets[16]),
    responseSize: reader.readLong(offsets[17]),
    searchableText: reader.readString(offsets[18]),
    sessionId: reader.readString(offsets[19]),
    source: reader.readString(offsets[20]),
    startedAt: reader.readDateTime(offsets[21]),
    statusCode: reader.readLongOrNull(offsets[22]),
    url: reader.readString(offsets[23]),
  );
  return object;
}

P _chuckerHttpRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readDateTime(offset)) as P;
    case 22:
      return (reader.readLongOrNull(offset)) as P;
    case 23:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chuckerHttpRecordGetId(ChuckerHttpRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chuckerHttpRecordGetLinks(
  ChuckerHttpRecord object,
) {
  return [];
}

void _chuckerHttpRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  ChuckerHttpRecord object,
) {
  object.id = id;
}

extension ChuckerHttpRecordQueryWhereSort
    on QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QWhere> {
  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhere> anyPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'path'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhere>
  anySearchableText() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'searchableText'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhere>
  anyStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startedAt'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhere> anyEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'endedAt'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhere>
  anyDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'durationMs'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhere>
  anyStatusCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'statusCode'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhere>
  anyHasError() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'hasError'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhere>
  anyIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isCancelled'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhere> anyIsSlow() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isSlow'),
      );
    });
  }
}

extension ChuckerHttpRecordQueryWhere
    on QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QWhereClause> {
  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  sessionIdEqualTo(String sessionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'sessionId', value: [sessionId]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  sessionIdNotEqualTo(String sessionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionId',
                lower: [],
                upper: [sessionId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionId',
                lower: [sessionId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionId',
                lower: [sessionId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'sessionId',
                lower: [],
                upper: [sessionId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  sourceEqualTo(String source) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'source', value: [source]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  sourceNotEqualTo(String source) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'source',
                lower: [],
                upper: [source],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'source',
                lower: [source],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'source',
                lower: [source],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'source',
                lower: [],
                upper: [source],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  methodEqualTo(String method) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'method', value: [method]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  methodNotEqualTo(String method) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'method',
                lower: [],
                upper: [method],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'method',
                lower: [method],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'method',
                lower: [method],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'method',
                lower: [],
                upper: [method],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  hostEqualTo(String host) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'host', value: [host]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  hostNotEqualTo(String host) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'host',
                lower: [],
                upper: [host],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'host',
                lower: [host],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'host',
                lower: [host],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'host',
                lower: [],
                upper: [host],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  pathEqualTo(String path) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'path', value: [path]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  pathNotEqualTo(String path) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'path',
                lower: [],
                upper: [path],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'path',
                lower: [path],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'path',
                lower: [path],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'path',
                lower: [],
                upper: [path],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  pathGreaterThan(String path, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'path',
          lower: [path],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  pathLessThan(String path, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'path',
          lower: [],
          upper: [path],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  pathBetween(
    String lowerPath,
    String upperPath, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'path',
          lower: [lowerPath],
          includeLower: includeLower,
          upper: [upperPath],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  pathStartsWith(String PathPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'path',
          lower: [PathPrefix],
          upper: ['$PathPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'path', value: ['']),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'path', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'path', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'path', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'path', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  searchableTextEqualTo(String searchableText) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'searchableText',
          value: [searchableText],
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  searchableTextNotEqualTo(String searchableText) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'searchableText',
                lower: [],
                upper: [searchableText],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'searchableText',
                lower: [searchableText],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'searchableText',
                lower: [searchableText],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'searchableText',
                lower: [],
                upper: [searchableText],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  searchableTextGreaterThan(String searchableText, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'searchableText',
          lower: [searchableText],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  searchableTextLessThan(String searchableText, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'searchableText',
          lower: [],
          upper: [searchableText],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  searchableTextBetween(
    String lowerSearchableText,
    String upperSearchableText, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'searchableText',
          lower: [lowerSearchableText],
          includeLower: includeLower,
          upper: [upperSearchableText],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  searchableTextStartsWith(String SearchableTextPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'searchableText',
          lower: [SearchableTextPrefix],
          upper: ['$SearchableTextPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  searchableTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'searchableText', value: ['']),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  searchableTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'searchableText',
                upper: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'searchableText',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'searchableText',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'searchableText',
                upper: [''],
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  startedAtEqualTo(DateTime startedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'startedAt', value: [startedAt]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  startedAtNotEqualTo(DateTime startedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startedAt',
                lower: [],
                upper: [startedAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startedAt',
                lower: [startedAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startedAt',
                lower: [startedAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startedAt',
                lower: [],
                upper: [startedAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  startedAtGreaterThan(DateTime startedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'startedAt',
          lower: [startedAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  startedAtLessThan(DateTime startedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'startedAt',
          lower: [],
          upper: [startedAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  startedAtBetween(
    DateTime lowerStartedAt,
    DateTime upperStartedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'startedAt',
          lower: [lowerStartedAt],
          includeLower: includeLower,
          upper: [upperStartedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  endedAtEqualTo(DateTime endedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'endedAt', value: [endedAt]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  endedAtNotEqualTo(DateTime endedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'endedAt',
                lower: [],
                upper: [endedAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'endedAt',
                lower: [endedAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'endedAt',
                lower: [endedAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'endedAt',
                lower: [],
                upper: [endedAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  endedAtGreaterThan(DateTime endedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'endedAt',
          lower: [endedAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  endedAtLessThan(DateTime endedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'endedAt',
          lower: [],
          upper: [endedAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  endedAtBetween(
    DateTime lowerEndedAt,
    DateTime upperEndedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'endedAt',
          lower: [lowerEndedAt],
          includeLower: includeLower,
          upper: [upperEndedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  durationMsEqualTo(int durationMs) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'durationMs', value: [durationMs]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  durationMsNotEqualTo(int durationMs) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'durationMs',
                lower: [],
                upper: [durationMs],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'durationMs',
                lower: [durationMs],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'durationMs',
                lower: [durationMs],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'durationMs',
                lower: [],
                upper: [durationMs],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  durationMsGreaterThan(int durationMs, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'durationMs',
          lower: [durationMs],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  durationMsLessThan(int durationMs, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'durationMs',
          lower: [],
          upper: [durationMs],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  durationMsBetween(
    int lowerDurationMs,
    int upperDurationMs, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'durationMs',
          lower: [lowerDurationMs],
          includeLower: includeLower,
          upper: [upperDurationMs],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  statusCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'statusCode', value: [null]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  statusCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'statusCode',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  statusCodeEqualTo(int? statusCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'statusCode', value: [statusCode]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  statusCodeNotEqualTo(int? statusCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'statusCode',
                lower: [],
                upper: [statusCode],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'statusCode',
                lower: [statusCode],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'statusCode',
                lower: [statusCode],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'statusCode',
                lower: [],
                upper: [statusCode],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  statusCodeGreaterThan(int? statusCode, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'statusCode',
          lower: [statusCode],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  statusCodeLessThan(int? statusCode, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'statusCode',
          lower: [],
          upper: [statusCode],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  statusCodeBetween(
    int? lowerStatusCode,
    int? upperStatusCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'statusCode',
          lower: [lowerStatusCode],
          includeLower: includeLower,
          upper: [upperStatusCode],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  hasErrorEqualTo(bool hasError) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'hasError', value: [hasError]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  hasErrorNotEqualTo(bool hasError) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hasError',
                lower: [],
                upper: [hasError],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hasError',
                lower: [hasError],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hasError',
                lower: [hasError],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'hasError',
                lower: [],
                upper: [hasError],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  isCancelledEqualTo(bool isCancelled) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'isCancelled',
          value: [isCancelled],
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  isCancelledNotEqualTo(bool isCancelled) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isCancelled',
                lower: [],
                upper: [isCancelled],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isCancelled',
                lower: [isCancelled],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isCancelled',
                lower: [isCancelled],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isCancelled',
                lower: [],
                upper: [isCancelled],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  isSlowEqualTo(bool isSlow) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'isSlow', value: [isSlow]),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterWhereClause>
  isSlowNotEqualTo(bool isSlow) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isSlow',
                lower: [],
                upper: [isSlow],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isSlow',
                lower: [isSlow],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isSlow',
                lower: [isSlow],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isSlow',
                lower: [],
                upper: [isSlow],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension ChuckerHttpRecordQueryFilter
    on QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QFilterCondition> {
  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'contentType'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'contentType'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'contentType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'contentType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'contentType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'contentType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'contentType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'contentType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'contentType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'contentType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'contentType', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  contentTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'contentType', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  durationMsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'durationMs', value: value),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  durationMsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'durationMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  durationMsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'durationMs',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  durationMsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'durationMs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  endedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'endedAt', value: value),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  endedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'endedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  endedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'endedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  endedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'endedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'error'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'error'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'error',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'error',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'error', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'error', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'errorType'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'errorType'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'errorType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'errorType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'errorType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'errorType', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  errorTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'errorType', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  hasErrorEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasError', value: value),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  hostEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'host',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  hostGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'host',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  hostLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'host',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  hostBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'host',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  hostStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'host',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  hostEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'host',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  hostContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'host',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  hostMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'host',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  hostIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'host', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  hostIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'host', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  isCancelledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCancelled', value: value),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  isSlowEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSlow', value: value),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  methodEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'method',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  methodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'method',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  methodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'method',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  methodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'method',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  methodStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'method',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  methodEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'method',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  methodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'method',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  methodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'method',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  methodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'method', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  methodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'method', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  pathEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  pathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  pathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  pathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'path',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  pathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  pathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'path',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'path',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'path', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'path', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  queryParametersJsonEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'queryParametersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  queryParametersJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'queryParametersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  queryParametersJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'queryParametersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  queryParametersJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'queryParametersJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  queryParametersJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'queryParametersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  queryParametersJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'queryParametersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  queryParametersJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'queryParametersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  queryParametersJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'queryParametersJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  queryParametersJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'queryParametersJson', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  queryParametersJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'queryParametersJson',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'requestBody'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'requestBody'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'requestBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'requestBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'requestBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'requestBody',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'requestBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'requestBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'requestBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'requestBody',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'requestBody', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestBodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'requestBody', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestHeadersJsonEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'requestHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestHeadersJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'requestHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestHeadersJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'requestHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestHeadersJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'requestHeadersJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestHeadersJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'requestHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestHeadersJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'requestHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestHeadersJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'requestHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestHeadersJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'requestHeadersJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestHeadersJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'requestHeadersJson', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestHeadersJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'requestHeadersJson', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'requestSize', value: value),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestSizeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'requestSize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestSizeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'requestSize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  requestSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'requestSize',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'responseBody'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'responseBody'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'responseBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'responseBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'responseBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'responseBody',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'responseBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'responseBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'responseBody',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'responseBody',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'responseBody', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseBodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'responseBody', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseHeadersJsonEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'responseHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseHeadersJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'responseHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseHeadersJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'responseHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseHeadersJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'responseHeadersJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseHeadersJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'responseHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseHeadersJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'responseHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseHeadersJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'responseHeadersJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseHeadersJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'responseHeadersJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseHeadersJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'responseHeadersJson', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseHeadersJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'responseHeadersJson',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'responseSize', value: value),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseSizeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'responseSize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseSizeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'responseSize',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  responseSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'responseSize',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  searchableTextEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'searchableText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  searchableTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'searchableText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  searchableTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'searchableText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  searchableTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'searchableText',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  searchableTextStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'searchableText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  searchableTextEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'searchableText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  searchableTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'searchableText',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  searchableTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'searchableText',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  searchableTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'searchableText', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  searchableTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'searchableText', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sessionIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sessionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sessionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sessionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sessionId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sessionIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sessionIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sessionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'sessionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sessionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'sessionId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sessionId', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'sessionId', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sourceEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'source',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sourceStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sourceEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'source',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'source',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'source', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'source', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startedAt', value: value),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  startedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  startedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  statusCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'statusCode'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  statusCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'statusCode'),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  statusCodeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'statusCode', value: value),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  statusCodeGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'statusCode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  statusCodeLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'statusCode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  statusCodeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'statusCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  urlEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  urlLessThan(String value, {bool include = false, bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'url',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  urlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  urlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  urlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  urlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'url',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'url', value: ''),
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterFilterCondition>
  urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'url', value: ''),
      );
    });
  }
}

extension ChuckerHttpRecordQueryObject
    on QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QFilterCondition> {}

extension ChuckerHttpRecordQueryLinks
    on QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QFilterCondition> {}

extension ChuckerHttpRecordQuerySortBy
    on QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QSortBy> {
  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByContentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByContentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMs', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByDurationMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMs', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByErrorType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorType', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByErrorTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorType', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByHasError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasError', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByHasErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasError', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByHost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'host', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByHostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'host', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByIsCancelledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByIsSlow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSlow', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByIsSlowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSlow', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByQueryParametersJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryParametersJson', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByQueryParametersJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryParametersJson', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByRequestBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestBody', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByRequestBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestBody', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByRequestHeadersJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestHeadersJson', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByRequestHeadersJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestHeadersJson', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByRequestSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestSize', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByRequestSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestSize', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByResponseBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseBody', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByResponseBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseBody', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByResponseHeadersJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseHeadersJson', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByResponseHeadersJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseHeadersJson', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByResponseSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseSize', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByResponseSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseSize', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortBySearchableText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchableText', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortBySearchableTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchableText', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByStatusCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusCode', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByStatusCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusCode', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension ChuckerHttpRecordQuerySortThenBy
    on QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QSortThenBy> {
  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByContentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByContentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMs', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByDurationMsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationMs', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByErrorType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorType', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByErrorTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'errorType', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByHasError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasError', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByHasErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasError', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByHost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'host', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByHostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'host', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByIsCancelledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByIsSlow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSlow', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByIsSlowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSlow', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'method', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByQueryParametersJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryParametersJson', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByQueryParametersJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryParametersJson', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByRequestBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestBody', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByRequestBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestBody', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByRequestHeadersJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestHeadersJson', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByRequestHeadersJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestHeadersJson', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByRequestSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestSize', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByRequestSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'requestSize', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByResponseBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseBody', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByResponseBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseBody', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByResponseHeadersJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseHeadersJson', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByResponseHeadersJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseHeadersJson', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByResponseSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseSize', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByResponseSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'responseSize', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenBySearchableText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchableText', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenBySearchableTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchableText', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sessionId', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByStatusCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusCode', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByStatusCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusCode', Sort.desc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QAfterSortBy>
  thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension ChuckerHttpRecordQueryWhereDistinct
    on QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct> {
  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByContentType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contentType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByDurationMs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationMs');
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endedAt');
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'error', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByErrorType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'errorType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByHasError() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasError');
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct> distinctByHost({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'host', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCancelled');
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByIsSlow() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSlow');
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'method', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct> distinctByPath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByQueryParametersJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'queryParametersJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByRequestBody({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requestBody', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByRequestHeadersJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'requestHeadersJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByRequestSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'requestSize');
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByResponseBody({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'responseBody', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByResponseHeadersJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'responseHeadersJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByResponseSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'responseSize');
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctBySearchableText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'searchableText',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctBySessionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sessionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctBySource({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct>
  distinctByStatusCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusCode');
    });
  }

  QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QDistinct> distinctByUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension ChuckerHttpRecordQueryProperty
    on QueryBuilder<ChuckerHttpRecord, ChuckerHttpRecord, QQueryProperty> {
  QueryBuilder<ChuckerHttpRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String?, QQueryOperations>
  contentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contentType');
    });
  }

  QueryBuilder<ChuckerHttpRecord, int, QQueryOperations> durationMsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationMs');
    });
  }

  QueryBuilder<ChuckerHttpRecord, DateTime, QQueryOperations>
  endedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endedAt');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String?, QQueryOperations> errorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'error');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String?, QQueryOperations>
  errorTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'errorType');
    });
  }

  QueryBuilder<ChuckerHttpRecord, bool, QQueryOperations> hasErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasError');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String, QQueryOperations> hostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'host');
    });
  }

  QueryBuilder<ChuckerHttpRecord, bool, QQueryOperations>
  isCancelledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCancelled');
    });
  }

  QueryBuilder<ChuckerHttpRecord, bool, QQueryOperations> isSlowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSlow');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String, QQueryOperations> methodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'method');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String, QQueryOperations> pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String, QQueryOperations>
  queryParametersJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'queryParametersJson');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String?, QQueryOperations>
  requestBodyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestBody');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String, QQueryOperations>
  requestHeadersJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestHeadersJson');
    });
  }

  QueryBuilder<ChuckerHttpRecord, int, QQueryOperations> requestSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'requestSize');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String?, QQueryOperations>
  responseBodyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'responseBody');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String, QQueryOperations>
  responseHeadersJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'responseHeadersJson');
    });
  }

  QueryBuilder<ChuckerHttpRecord, int, QQueryOperations>
  responseSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'responseSize');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String, QQueryOperations>
  searchableTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'searchableText');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String, QQueryOperations>
  sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sessionId');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<ChuckerHttpRecord, DateTime, QQueryOperations>
  startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<ChuckerHttpRecord, int?, QQueryOperations> statusCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusCode');
    });
  }

  QueryBuilder<ChuckerHttpRecord, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
