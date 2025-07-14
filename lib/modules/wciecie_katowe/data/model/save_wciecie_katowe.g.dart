// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_wciecie_katowe.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWciecieKatoweSaveCollection on Isar {
  IsarCollection<WciecieKatoweSave> get wciecieKatoweSaves => this.collection();
}

const WciecieKatoweSaveSchema = CollectionSchema(
  name: r'WciecieKatoweSave',
  id: -1432269605775964008,
  properties: {
    r'nazwa': PropertySchema(
      id: 0,
      name: r'nazwa',
      type: IsarType.string,
    ),
    r'wciecieKatoweModel': PropertySchema(
      id: 1,
      name: r'wciecieKatoweModel',
      type: IsarType.object,
      target: r'WciecieKatoweModel',
    )
  },
  estimateSize: _wciecieKatoweSaveEstimateSize,
  serialize: _wciecieKatoweSaveSerialize,
  deserialize: _wciecieKatoweSaveDeserialize,
  deserializeProp: _wciecieKatoweSaveDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'WciecieKatoweModel': WciecieKatoweModelSchema},
  getId: _wciecieKatoweSaveGetId,
  getLinks: _wciecieKatoweSaveGetLinks,
  attach: _wciecieKatoweSaveAttach,
  version: '3.1.0+1',
);

int _wciecieKatoweSaveEstimateSize(
  WciecieKatoweSave object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nazwa.length * 3;
  bytesCount += 3 +
      WciecieKatoweModelSchema.estimateSize(object.wciecieKatoweModel,
          allOffsets[WciecieKatoweModel]!, allOffsets);
  return bytesCount;
}

void _wciecieKatoweSaveSerialize(
  WciecieKatoweSave object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.nazwa);
  writer.writeObject<WciecieKatoweModel>(
    offsets[1],
    allOffsets,
    WciecieKatoweModelSchema.serialize,
    object.wciecieKatoweModel,
  );
}

WciecieKatoweSave _wciecieKatoweSaveDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WciecieKatoweSave(
    reader.readString(offsets[0]),
    reader.readObjectOrNull<WciecieKatoweModel>(
          offsets[1],
          WciecieKatoweModelSchema.deserialize,
          allOffsets,
        ) ??
        WciecieKatoweModel(),
  );
  object.id = id;
  return object;
}

P _wciecieKatoweSaveDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<WciecieKatoweModel>(
            offset,
            WciecieKatoweModelSchema.deserialize,
            allOffsets,
          ) ??
          WciecieKatoweModel()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _wciecieKatoweSaveGetId(WciecieKatoweSave object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wciecieKatoweSaveGetLinks(
    WciecieKatoweSave object) {
  return [];
}

void _wciecieKatoweSaveAttach(
    IsarCollection<dynamic> col, Id id, WciecieKatoweSave object) {
  object.id = id;
}

extension WciecieKatoweSaveQueryWhereSort
    on QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QWhere> {
  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WciecieKatoweSaveQueryWhere
    on QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QWhereClause> {
  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterWhereClause>
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

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WciecieKatoweSaveQueryFilter
    on QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QFilterCondition> {
  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      nazwaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nazwa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      nazwaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nazwa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      nazwaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nazwa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      nazwaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nazwa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      nazwaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nazwa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      nazwaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nazwa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      nazwaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nazwa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      nazwaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nazwa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      nazwaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nazwa',
        value: '',
      ));
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      nazwaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nazwa',
        value: '',
      ));
    });
  }
}

extension WciecieKatoweSaveQueryObject
    on QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QFilterCondition> {
  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterFilterCondition>
      wciecieKatoweModel(FilterQuery<WciecieKatoweModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'wciecieKatoweModel');
    });
  }
}

extension WciecieKatoweSaveQueryLinks
    on QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QFilterCondition> {}

extension WciecieKatoweSaveQuerySortBy
    on QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QSortBy> {
  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterSortBy>
      sortByNazwa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.asc);
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterSortBy>
      sortByNazwaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.desc);
    });
  }
}

extension WciecieKatoweSaveQuerySortThenBy
    on QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QSortThenBy> {
  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterSortBy>
      thenByNazwa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.asc);
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QAfterSortBy>
      thenByNazwaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.desc);
    });
  }
}

extension WciecieKatoweSaveQueryWhereDistinct
    on QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QDistinct> {
  QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QDistinct> distinctByNazwa(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nazwa', caseSensitive: caseSensitive);
    });
  }
}

extension WciecieKatoweSaveQueryProperty
    on QueryBuilder<WciecieKatoweSave, WciecieKatoweSave, QQueryProperty> {
  QueryBuilder<WciecieKatoweSave, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WciecieKatoweSave, String, QQueryOperations> nazwaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nazwa');
    });
  }

  QueryBuilder<WciecieKatoweSave, WciecieKatoweModel, QQueryOperations>
      wciecieKatoweModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wciecieKatoweModel');
    });
  }
}
