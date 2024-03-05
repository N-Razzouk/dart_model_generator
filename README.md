# dart_model_generator

A Dart package to generate Dart models from json schema.

## Usage

- Json Schemas should be in the `json` directory.
- Run `setup.sh` to generate the models.
- Generated models will be in the `lib/models` directory.

## Features

- Generate models from json schema.
- Types covered: `string`, `number`, `integer`, `double`, `boolean`, `array`, `object`, `enum`.
- Supports `required` and `nullable` fields.
- Generates `fromJson` and `toJson` methods for each model.
- Generates `copyWith` method for each model.
