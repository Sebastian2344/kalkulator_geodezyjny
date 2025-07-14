// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wciecie_liniowe_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WciecieLinioweModelSchema = Schema(
  name: r'WciecieLinioweModel',
  id: 7154455914543022333,
  properties: {
    r'ab': PropertySchema(
      id: 0,
      name: r'ab',
      type: IsarType.double,
    ),
    r'ap': PropertySchema(
      id: 1,
      name: r'ap',
      type: IsarType.double,
    ),
    r'bp': PropertySchema(
      id: 2,
      name: r'bp',
      type: IsarType.double,
    ),
    r'cA': PropertySchema(
      id: 3,
      name: r'cA',
      type: IsarType.double,
    ),
    r'cB': PropertySchema(
      id: 4,
      name: r'cB',
      type: IsarType.double,
    ),
    r'cC': PropertySchema(
      id: 5,
      name: r'cC',
      type: IsarType.double,
    ),
    r'px4': PropertySchema(
      id: 6,
      name: r'px4',
      type: IsarType.double,
    ),
    r'xA': PropertySchema(
      id: 7,
      name: r'xA',
      type: IsarType.double,
    ),
    r'xB': PropertySchema(
      id: 8,
      name: r'xB',
      type: IsarType.double,
    ),
    r'xP': PropertySchema(
      id: 9,
      name: r'xP',
      type: IsarType.double,
    ),
    r'yA': PropertySchema(
      id: 10,
      name: r'yA',
      type: IsarType.double,
    ),
    r'yB': PropertySchema(
      id: 11,
      name: r'yB',
      type: IsarType.double,
    ),
    r'yP': PropertySchema(
      id: 12,
      name: r'yP',
      type: IsarType.double,
    )
  },
  estimateSize: _wciecieLinioweModelEstimateSize,
  serialize: _wciecieLinioweModelSerialize,
  deserialize: _wciecieLinioweModelDeserialize,
  deserializeProp: _wciecieLinioweModelDeserializeProp,
);

int _wciecieLinioweModelEstimateSize(
  WciecieLinioweModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _wciecieLinioweModelSerialize(
  WciecieLinioweModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.ab);
  writer.writeDouble(offsets[1], object.ap);
  writer.writeDouble(offsets[2], object.bp);
  writer.writeDouble(offsets[3], object.cA);
  writer.writeDouble(offsets[4], object.cB);
  writer.writeDouble(offsets[5], object.cC);
  writer.writeDouble(offsets[6], object.px4);
  writer.writeDouble(offsets[7], object.xA);
  writer.writeDouble(offsets[8], object.xB);
  writer.writeDouble(offsets[9], object.xP);
  writer.writeDouble(offsets[10], object.yA);
  writer.writeDouble(offsets[11], object.yB);
  writer.writeDouble(offsets[12], object.yP);
}

WciecieLinioweModel _wciecieLinioweModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WciecieLinioweModel(
    reader.readDoubleOrNull(offsets[7]),
    reader.readDoubleOrNull(offsets[10]),
    reader.readDoubleOrNull(offsets[8]),
    reader.readDoubleOrNull(offsets[11]),
    reader.readDoubleOrNull(offsets[9]),
    reader.readDoubleOrNull(offsets[12]),
    reader.readDoubleOrNull(offsets[6]),
    reader.readDoubleOrNull(offsets[3]),
    reader.readDoubleOrNull(offsets[5]),
    reader.readDoubleOrNull(offsets[4]),
    reader.readDoubleOrNull(offsets[1]),
    reader.readDoubleOrNull(offsets[2]),
    reader.readDoubleOrNull(offsets[0]),
  );
  return object;
}

P _wciecieLinioweModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension WciecieLinioweModelQueryFilter on QueryBuilder<WciecieLinioweModel,
    WciecieLinioweModel, QFilterCondition> {
  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      abIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ab',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      abIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ab',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      abEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ab',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      abGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ab',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      abLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ab',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      abBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ab',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      apIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ap',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      apIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ap',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      apEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ap',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      apGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ap',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      apLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ap',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      apBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ap',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      bpIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bp',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      bpIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bp',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      bpEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      bpGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      bpLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      bpBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cAIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cA',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cAIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cA',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cAEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cAGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cALessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cABetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cA',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cBIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cB',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cBIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cB',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cBEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cBGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cBLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cBBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cB',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cCIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cC',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cCIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cC',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cCEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cC',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cCGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cC',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cCLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cC',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      cCBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cC',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      px4IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'px4',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      px4IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'px4',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      px4EqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'px4',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      px4GreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'px4',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      px4LessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'px4',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      px4Between(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'px4',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xAIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xA',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xAIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xA',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xAEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xAGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xALessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xABetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xA',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xBIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xB',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xBIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xB',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xBEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xBGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xBLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xBBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xB',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xPIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xP',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xPIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xP',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xPEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xP',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xPGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xP',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xPLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xP',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      xPBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xP',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yAIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yA',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yAIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yA',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yAEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yAGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yALessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yA',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yABetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yA',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yBIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yB',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yBIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yB',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yBEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yBGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yBLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yB',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yBBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yB',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yPIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yP',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yPIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yP',
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yPEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yP',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yPGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yP',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yPLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yP',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieLinioweModel, WciecieLinioweModel, QAfterFilterCondition>
      yPBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yP',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension WciecieLinioweModelQueryObject on QueryBuilder<WciecieLinioweModel,
    WciecieLinioweModel, QFilterCondition> {}
