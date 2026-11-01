import 'package:flutter/material.dart';

import 'device_mockup.dart';
import 'landing_feature_rail.dart';

class LandingPreview extends StatelessWidget {
  const LandingPreview({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, c) => c.maxWidth < 580
        ? const DeviceMockup()
        : const Row(
            children: [
              Expanded(child: DeviceMockup()),
              SizedBox(width: 18),
              SizedBox(width: 205, child: LandingFeatureRail()),
            ],
          ),
  );
}
