// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_biegunowa.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSaveBiegunowaCollection on Isar {
  IsarCollection<SaveBiegunowa> get saveBiegunowas => this.collection();
}

const SaveBiegunowaSchema = CollectionSchema(
  name: r'SaveBiegunowa',
  id: -1449343523089721845,
  properties: {
    r'azymut': PropertySchema(
      id: 0,
      name: r'azymut',
      type: IsarType.string,
    ),
    r'dane': PropertySchema(
      id: 1,
      name: r'dane',
      type: IsarType.stringList,
    ),
    r'nazwa': PropertySchema(
      id: 2,
      name: r'nazwa',
      type: IsarType.string,
    ),
    r'przyrosty': PropertySchema(
      id: 3,
      name: r'przyrosty',
      type: IsarType.stringList,
    ),
    r'wyniki': PropertySchema(
      id: 4,
      name: r'wyniki',
      type: IsarType.stringList,
    )
  },
  estimateSize: _saveBiegunowaEstimateSize,
  serialize: _saveBiegunowaSerialize,
  deserialize: _saveBiegunowaDeserialize,
  deserializeProp: _saveBiegunowaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _saveBiegunowaGetId,
  getLinks: _saveBiegunowaGetLinks,
  attach: _saveBiegunowaAttach,
  version: '3.1.0+1',
);

int _saveBiegunowaEstimateSize(
  SaveBiegunowa object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.azymut.length * 3;
  bytesCount += 3 + object.dane.length * 3;
  {
    for (var i = 0; i < object.dane.length; i++) {
      final value = object.dane[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.nazwa.length * 3;
  bytesCount += 3 + object.przyrosty.length * 3;
  {
    for (var i = 0; i < object.przyrosty.length; i++) {
      final value = object.przyrosty[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.wyniki.length * 3;
  {
    for (var i = 0; i < object.wyniki.length; i++) {
      final value = object.wyniki[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _saveBiegunowaSerialize(
  SaveBiegunowa object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.azymut);
  writer.writeStringList(offsets[1], object.dane);
  writer.writeString(offsets[2], object.nazwa);
  writer.writeStringList(offsets[3], object.przyrosty);
  writer.writeStringList(offsets[4], object.wyniki);
}

SaveBiegunowa _saveBiegunowaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SaveBiegunowa();
  object.azymut = reader.readString(offsets[0]);
  object.dane = reader.readStringList(offsets[1]) ?? [];
  object.id = id;
  object.nazwa = reader.readString(offsets[2]);
  object.przyrosty = reader.readStringList(offsets[3]) ?? [];
  object.wyniki = reader.readStringList(offsets[4]) ?? [];
  return object;
}

P _saveBiegunowaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _saveBiegunowaGetId(SaveBiegunowa object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _saveBiegunowaGetLinks(SaveBiegunowa object) {
  return [];
}

void _saveBiegunowaAttach(
    IsarCollection<dynamic> col, Id id, SaveBiegunowa object) {
  object.id = id;
}

extension SaveBiegunowaQueryWhereSort
    on QueryBuilder<SaveBiegunowa, SaveBiegunowa, QWhere> {
  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SaveBiegunowaQueryWhere
    on QueryBuilder<SaveBiegunowa, SaveBiegunowa, QWhereClause> {
  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterWhereClause> idBetween(
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

extension SaveBiegunowaQueryFilter
    on QueryBuilder<SaveBiegunowa, SaveBiegunowa, QFilterCondition> {
  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      azymutEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'azymut',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      azymutGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'azymut',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      azymutLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'azymut',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      azymutBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'azymut',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      azymutStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'azymut',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      azymutEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'azymut',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      azymutContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'azymut',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      azymutMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'azymut',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      azymutIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'azymut',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      azymutIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'azymut',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      daneElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      daneElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      daneElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      daneElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dane',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      daneElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      daneElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      daneElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dane',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      daneElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dane',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      daneElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dane',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      daneElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dane',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      nazwaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nazwa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      nazwaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nazwa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      nazwaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nazwa',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      nazwaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nazwa',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      przyrostyElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'przyrosty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      przyrostyElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'przyrosty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      przyrostyElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'przyrosty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      przyrostyElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'przyrosty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      przyrostyElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'przyrosty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      przyrostyElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'przyrosty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      przyrostyElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'przyrosty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      przyrostyElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'przyrosty',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      przyrostyElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'przyrosty',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      przyrostyElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'przyrosty',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      wynikiElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wyniki',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      wynikiElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wyniki',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      wynikiElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wyniki',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      wynikiElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wyniki',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      wynikiElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wyniki',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      wynikiElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wyniki',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      wynikiElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wyniki',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      wynikiElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wyniki',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      wynikiElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wyniki',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
      wynikiElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wyniki',
        value: '',
      ));
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterFilterCondition>
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

extension SaveBiegunowaQueryObject
    on QueryBuilder<SaveBiegunowa, SaveBiegunowa, QFilterCondition> {}

extension SaveBiegunowaQueryLinks
    on QueryBuilder<SaveBiegunowa, SaveBiegunowa, QFilterCondition> {}

extension SaveBiegunowaQuerySortBy
    on QueryBuilder<SaveBiegunowa, SaveBiegunowa, QSortBy> {
  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterSortBy> sortByAzymut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azymut', Sort.asc);
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterSortBy> sortByAzymutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azymut', Sort.desc);
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterSortBy> sortByNazwa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.asc);
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterSortBy> sortByNazwaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.desc);
    });
  }
}

extension SaveBiegunowaQuerySortThenBy
    on QueryBuilder<SaveBiegunowa, SaveBiegunowa, QSortThenBy> {
  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterSortBy> thenByAzymut() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azymut', Sort.asc);
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterSortBy> thenByAzymutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'azymut', Sort.desc);
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterSortBy> thenByNazwa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.asc);
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QAfterSortBy> thenByNazwaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nazwa', Sort.desc);
    });
  }
}

extension SaveBiegunowaQueryWhereDistinct
    on QueryBuilder<SaveBiegunowa, SaveBiegunowa, QDistinct> {
  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QDistinct> distinctByAzymut(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'azymut', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QDistinct> distinctByDane() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dane');
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QDistinct> distinctByNazwa(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nazwa', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QDistinct> distinctByPrzyrosty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'przyrosty');
    });
  }

  QueryBuilder<SaveBiegunowa, SaveBiegunowa, QDistinct> distinctByWyniki() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wyniki');
    });
  }
}

extension SaveBiegunowaQueryProperty
    on QueryBuilder<SaveBiegunowa, SaveBiegunowa, QQueryProperty> {
  QueryBuilder<SaveBiegunowa, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SaveBiegunowa, String, QQueryOperations> azymutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'azymut');
    });
  }

  QueryBuilder<SaveBiegunowa, List<String>, QQueryOperations> daneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dane');
    });
  }

  QueryBuilder<SaveBiegunowa, String, QQueryOperations> nazwaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nazwa');
    });
  }

  QueryBuilder<SaveBiegunowa, List<String>, QQueryOperations>
      przyrostyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'przyrosty');
    });
  }

  QueryBuilder<SaveBiegunowa, List<String>, QQueryOperations> wynikiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wyniki');
    });
  }
}
