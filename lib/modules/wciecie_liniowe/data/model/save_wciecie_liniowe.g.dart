// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_wciecie_liniowe.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWciecieLinioweSaveCollection on Isar {
  IsarCollection<WciecieLinioweSave> get wciecieLinioweSaves =>
      this.collection();
}

const WciecieLinioweSaveSchema = CollectionSchema(
  name: r'WciecieLinioweSave',
  id: 8354259663626124143,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'wciecieLinioweModel': PropertySchema(
      id: 1,
      name: r'wciecieLinioweModel',
      type: IsarType.object,
      target: r'WciecieLinioweModel',
    )
  },
  estimateSize: _wciecieLinioweSaveEstimateSize,
  serialize: _wciecieLinioweSaveSerialize,
  deserialize: _wciecieLinioweSaveDeserialize,
  deserializeProp: _wciecieLinioweSaveDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'WciecieLinioweModel': WciecieLinioweModelSchema},
  getId: _wciecieLinioweSaveGetId,
  getLinks: _wciecieLinioweSaveGetLinks,
  attach: _wciecieLinioweSaveAttach,
  version: '3.3.0',
);

int _wciecieLinioweSaveEstimateSize(
  WciecieLinioweSave object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 +
      WciecieLinioweModelSchema.estimateSize(object.wciecieLinioweModel,
          allOffsets[WciecieLinioweModel]!, allOffsets);
  return bytesCount;
}

void _wciecieLinioweSaveSerialize(
  WciecieLinioweSave object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeObject<WciecieLinioweModel>(
    offsets[1],
    allOffsets,
    WciecieLinioweModelSchema.serialize,
    object.wciecieLinioweModel,
  );
}

WciecieLinioweSave _wciecieLinioweSaveDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WciecieLinioweSave(
    reader.readString(offsets[0]),
    reader.readObjectOrNull<WciecieLinioweModel>(
          offsets[1],
          WciecieLinioweModelSchema.deserialize,
          allOffsets,
        ) ??
        WciecieLinioweModel(),
  );
  object.id = id;
  return object;
}

P _wciecieLinioweSaveDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<WciecieLinioweModel>(
            offset,
            WciecieLinioweModelSchema.deserialize,
            allOffsets,
          ) ??
          WciecieLinioweModel()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _wciecieLinioweSaveGetId(WciecieLinioweSave object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wciecieLinioweSaveGetLinks(
    WciecieLinioweSave object) {
  return [];
}

void _wciecieLinioweSaveAttach(
    IsarCollection<dynamic> col, Id id, WciecieLinioweSave object) {
  object.id = id;
}

extension WciecieLinioweSaveQueryWhereSort
    on QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QWhere> {
  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WciecieLinioweSaveQueryWhere
    on QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QWhereClause> {
  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterWhereClause>
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

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterWhereClause>
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

extension WciecieLinioweSaveQueryFilter
    on QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QFilterCondition> {
  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
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

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
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

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
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

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension WciecieLinioweSaveQueryObject
    on QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QFilterCondition> {
  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterFilterCondition>
      wciecieLinioweModel(FilterQuery<WciecieLinioweModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'wciecieLinioweModel');
    });
  }
}

extension WciecieLinioweSaveQueryLinks
    on QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QFilterCondition> {}

extension WciecieLinioweSaveQuerySortBy
    on QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QSortBy> {
  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension WciecieLinioweSaveQuerySortThenBy
    on QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QSortThenBy> {
  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension WciecieLinioweSaveQueryWhereDistinct
    on QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QDistinct> {
  QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension WciecieLinioweSaveQueryProperty
    on QueryBuilder<WciecieLinioweSave, WciecieLinioweSave, QQueryProperty> {
  QueryBuilder<WciecieLinioweSave, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WciecieLinioweSave, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<WciecieLinioweSave, WciecieLinioweModel, QQueryOperations>
      wciecieLinioweModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wciecieLinioweModel');
    });
  }
}
