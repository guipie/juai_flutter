library annotations;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/db_generator.dart';

Builder dbBuilder(BuilderOptions options) => SharedPartBuilder([DBGenerator()], 'db');
