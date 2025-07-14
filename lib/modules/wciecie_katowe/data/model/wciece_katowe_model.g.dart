// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wciece_katowe_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WciecieKatoweModelSchema = Schema(
  name: r'WciecieKatoweModel',
  id: -8038437099829022521,
  properties: {
    r'alfaAngle': PropertySchema(
      id: 0,
      name: r'alfaAngle',
      type: IsarType.double,
    ),
    r'betaAngle': PropertySchema(
      id: 1,
      name: r'betaAngle',
      type: IsarType.double,
    ),
    r'controlGammaAngle': PropertySchema(
      id: 2,
      name: r'controlGammaAngle',
      type: IsarType.double,
    ),
    r'gammaAngle': PropertySchema(
      id: 3,
      name: r'gammaAngle',
      type: IsarType.double,
    ),
    r'xA': PropertySchema(
      id: 4,
      name: r'xA',
      type: IsarType.double,
    ),
    r'xB': PropertySchema(
      id: 5,
      name: r'xB',
      type: IsarType.double,
    ),
    r'xp': PropertySchema(
      id: 6,
      name: r'xp',
      type: IsarType.double,
    ),
    r'yA': PropertySchema(
      id: 7,
      name: r'yA',
      type: IsarType.double,
    ),
    r'yB': PropertySchema(
      id: 8,
      name: r'yB',
      type: IsarType.double,
    ),
    r'yp': PropertySchema(
      id: 9,
      name: r'yp',
      type: IsarType.double,
    )
  },
  estimateSize: _wciecieKatoweModelEstimateSize,
  serialize: _wciecieKatoweModelSerialize,
  deserialize: _wciecieKatoweModelDeserialize,
  deserializeProp: _wciecieKatoweModelDeserializeProp,
);

int _wciecieKatoweModelEstimateSize(
  WciecieKatoweModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _wciecieKatoweModelSerialize(
  WciecieKatoweModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.alfaAngle);
  writer.writeDouble(offsets[1], object.betaAngle);
  writer.writeDouble(offsets[2], object.controlGammaAngle);
  writer.writeDouble(offsets[3], object.gammaAngle);
  writer.writeDouble(offsets[4], object.xA);
  writer.writeDouble(offsets[5], object.xB);
  writer.writeDouble(offsets[6], object.xp);
  writer.writeDouble(offsets[7], object.yA);
  writer.writeDouble(offsets[8], object.yB);
  writer.writeDouble(offsets[9], object.yp);
}

WciecieKatoweModel _wciecieKatoweModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WciecieKatoweModel(
    reader.readDoubleOrNull(offsets[4]),
    reader.readDoubleOrNull(offsets[5]),
    reader.readDoubleOrNull(offsets[7]),
    reader.readDoubleOrNull(offsets[8]),
    reader.readDoubleOrNull(offsets[0]),
    reader.readDoubleOrNull(offsets[1]),
    reader.readDoubleOrNull(offsets[6]),
    reader.readDoubleOrNull(offsets[9]),
    reader.readDoubleOrNull(offsets[3]),
    reader.readDoubleOrNull(offsets[2]),
  );
  return object;
}

P _wciecieKatoweModelDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension WciecieKatoweModelQueryFilter
    on QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QFilterCondition> {
  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      alfaAngleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'alfaAngle',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      alfaAngleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'alfaAngle',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      alfaAngleEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alfaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      alfaAngleGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alfaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      alfaAngleLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alfaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      alfaAngleBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alfaAngle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      betaAngleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'betaAngle',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      betaAngleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'betaAngle',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      betaAngleEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'betaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      betaAngleGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'betaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      betaAngleLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'betaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      betaAngleBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'betaAngle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      controlGammaAngleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'controlGammaAngle',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      controlGammaAngleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'controlGammaAngle',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      controlGammaAngleEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'controlGammaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      controlGammaAngleGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'controlGammaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      controlGammaAngleLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'controlGammaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      controlGammaAngleBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'controlGammaAngle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      gammaAngleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gammaAngle',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      gammaAngleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gammaAngle',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      gammaAngleEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gammaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      gammaAngleGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gammaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      gammaAngleLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gammaAngle',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      gammaAngleBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gammaAngle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      xAIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xA',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      xAIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xA',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      xBIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xB',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      xBIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xB',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      xpIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'xp',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      xpIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'xp',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      xpEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'xp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      xpGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'xp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      xpLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'xp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      xpBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'xp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      yAIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yA',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      yAIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yA',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      yBIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yB',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      yBIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yB',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
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

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      ypIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yp',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      ypIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yp',
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      ypEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      ypGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      ypLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QAfterFilterCondition>
      ypBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension WciecieKatoweModelQueryObject
    on QueryBuilder<WciecieKatoweModel, WciecieKatoweModel, QFilterCondition> {}
