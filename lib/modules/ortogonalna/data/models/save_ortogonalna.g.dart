// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_ortogonalna.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSaveOrtogonalnaCollection on Isar {
  IsarCollection<SaveOrtogonalna> get saveOrtogonalnas => this.collection();
}

const SaveOrtogonalnaSchema = CollectionSchema(
  name: r'SaveOrtogonalna',
  id: 5239112440972301202,
  properties: {
    r'azymut': PropertySchema(
      id: 0,
      name: r'azymut',
      type: IsarType.double,
    ),
    r'dane': PropertySchema(
      id: 1,
      name: r'dane',
      type: IsarType.doubleList,
    ),
    r'nazwa': PropertySchema(
      id: 2,
      name: r'nazwa',
      type: IsarType.string,
    ),
    r'przyrosty': PropertySchema(
      id: 3,
      name: r'przyrosty',
      type: IsarType.doubleList,
    ),
    r'wyniki': PropertySchema(
      id: 4,
      name: r'wyniki',
      type: IsarType.doubleList,
    )
  },
  estimateSize: _saveOrtogonalnaEstimateSize,
  serialize: _saveOrtogonalnaSerialize,
  deserialize: _saveOrtogonalnaDeserialize,
  deserializeProp: _saveOrtogonalnaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _saveOrtogonalnaGetId,
  getLinks: _saveOrtogonalnaGetLinks,
  attach: _saveOrtogonalnaAttach,
  version: '3.3.0',
);

int _saveOrtogonalnaEstimateSize(
  SaveOrtogonalna object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dane;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  bytesCount += 3 + object.nazwa.length * 3;
  {
    final value = object.przyrosty;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  {
    final value = object.wyniki;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _saveOrtogonalnaSerialize(
  SaveOrtogonalna object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.azymut);
  writer.writeDoubleList(offsets[1], object.dane);
  writer.writeString(offsets[2], object.nazwa);
  writer.writeDoubleList(offsets[3], object.przyrosty);
  writer.writeDoubleList(offsets[4], object.wyniki);
}

SaveOrtogonalna _saveOrtogonalnaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SaveOrtogonalna();
  object.azymut = reader.readDoubleOrNull(offsets[0]);
  object.dane = reader.readDoubleList(offsets[1]);
  object.id = id;
  object.nazwa = reader.readString(offsets[2]);
  object.przyrosty = reader.readDoubleList(offsets[3]);
  object.wyniki = reader.readDoubleList(offsets[4]);
  return object;
}

P _saveOrtogonalnaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleList(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDoubleList(offset)) as P;
    case 4:
      return (reader.readDoubleList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _saveOrtogonalnaGetId(SaveOrtogonalna object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _saveOrtogonalnaGetLinks(SaveOrtogonalna object) {
  return [];
}

void _saveOrtogonalnaAttach(
    IsarCollection<dynamic> col, Id id, SaveOrtogonalna object) {
  object.id = id;
}

extension SaveOrtogonalnaQueryWhereSort
    on QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QWhere> {
  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SaveOrtogonalnaQueryWhere
    on QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QWhereClause> {
  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterWhereClause>
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

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterWhereClause> idBetween(
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

extension SaveOrtogonalnaQueryFilter
    on QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QFilterCondition> {
  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      azymutIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'azymut',
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      azymutIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'azymut',
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      azymutEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'azymut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      azymutGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'azymut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      azymutLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'azymut',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      azymutBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'azymut',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dane',
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dane',
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dane',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dane',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dane',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dane',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dane',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dane',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dane',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dane',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dane',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      daneLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dane',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
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

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
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

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
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

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
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

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
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

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
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

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
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

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
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

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
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

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      nazwaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nazwa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      nazwaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nazwa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      nazwaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nazwa',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      nazwaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nazwa',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'przyrosty',
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'przyrosty',
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'przyrosty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'przyrosty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'przyrosty',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'przyrosty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'przyrosty',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'przyrosty',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'przyrosty',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'przyrosty',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'przyrosty',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      przyrostyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'przyrosty',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wyniki',
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wyniki',
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wyniki',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wyniki',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wyniki',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wyniki',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wyniki',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wyniki',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wyniki',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wyniki',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wyniki',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterFilterCondition>
      wynikiLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wyniki',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension SaveOrtogonalnaQueryObject
    on QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QFilterCondition> {}

extension SaveOrtogonalnaQueryLinks
    on QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QFilterCondition> {}

extension SaveOrtogonalnaQuerySortBy
    on QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QSortBy> {
  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterSortBy> sortByAzymut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azymut', Sort.asc);
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterSortBy>
      sortByAzymutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azymut', Sort.desc);
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterSortBy> sortByNazwa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.asc);
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterSortBy>
      sortByNazwaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.desc);
    });
  }
}

extension SaveOrtogonalnaQuerySortThenBy
    on QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QSortThenBy> {
  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterSortBy> thenByAzymut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azymut', Sort.asc);
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterSortBy>
      thenByAzymutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azymut', Sort.desc);
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterSortBy> thenByNazwa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.asc);
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QAfterSortBy>
      thenByNazwaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.desc);
    });
  }
}

extension SaveOrtogonalnaQueryWhereDistinct
    on QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QDistinct> {
  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QDistinct> distinctByAzymut() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'azymut');
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QDistinct> distinctByDane() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dane');
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QDistinct> distinctByNazwa(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nazwa', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QDistinct>
      distinctByPrzyrosty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'przyrosty');
    });
  }

  QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QDistinct> distinctByWyniki() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wyniki');
    });
  }
}

extension SaveOrtogonalnaQueryProperty
    on QueryBuilder<SaveOrtogonalna, SaveOrtogonalna, QQueryProperty> {
  QueryBuilder<SaveOrtogonalna, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SaveOrtogonalna, double?, QQueryOperations> azymutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'azymut');
    });
  }

  QueryBuilder<SaveOrtogonalna, List<double>?, QQueryOperations>
      daneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dane');
    });
  }

  QueryBuilder<SaveOrtogonalna, String, QQueryOperations> nazwaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nazwa');
    });
  }

  QueryBuilder<SaveOrtogonalna, List<double>?, QQueryOperations>
      przyrostyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'przyrosty');
    });
  }

  QueryBuilder<SaveOrtogonalna, List<double>?, QQueryOperations>
      wynikiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wyniki');
    });
  }
}
