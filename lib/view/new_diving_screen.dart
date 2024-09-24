import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fx_stepper/fx_stepper.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/model/diving_model.dart';
import 'package:sea_sentinels/model/fish_item_model.dart';
import 'package:sea_sentinels/model/fish_model.dart';
import 'package:sea_sentinels/repositories/fish_repository.dart';
import 'package:sea_sentinels/view/widget/my_scaffold.dart';
import 'package:sea_sentinels/view/map_screen.dart';
import 'package:sea_sentinels/view/widget/diving_survey/diving_fish_survey.dart';
import 'package:sea_sentinels/view/widget/diving_survey/diving_information_survey.dart';
import 'package:sea_sentinels/view/widget/diving_survey/survey_text_field.dart';
import 'package:sea_sentinels/view/widget/text_border.dart';
import 'package:sea_sentinels/viewmodel/home_view_model.dart';
import 'package:sea_sentinels/providers/diving_provider.dart';

class NewDivingSurveyScreen extends ConsumerStatefulWidget {
  const NewDivingSurveyScreen({super.key});

  @override
  ConsumerState<NewDivingSurveyScreen> createState() =>
      _NewDivingSurveyScreenState();
}

class _NewDivingSurveyScreenState extends ConsumerState<NewDivingSurveyScreen> {
  late List<FishItem> fishList = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Diving newDiving = Diving.empty();
  late Provider newDivingProvider;

  late final List<TextEditingController> _controllers = [
    _dateTimeController,
    _depthController,
    _temperatureController,
    _schoolController,
    _areaController,
    _provinceController,
    _durationController,
    _maxDurationDepthController
  ];

  int _currentStep = 0;
  final _dateTimeController = TextEditingController();
  final _depthController = TextEditingController();
  final _areaController = TextEditingController();
  LatLng? _divingPosition;
  SoilType? _soilType;
  final _maxDurationDepthController = TextEditingController();
  final _durationController = TextEditingController();
  final List<Marker> _markers = [];
  final _provinceController = TextEditingController();
  final _schoolController = TextEditingController();
  bool _showError = false;
  final _temperatureController = TextEditingController();

  @override
  void dispose() {
    for (TextEditingController element in _controllers) {
      element.dispose();
    }
    super.dispose();
  }

  void tapMap(TapPosition details, LatLng position) {
    setState(() {
      _divingPosition = position;
      if (_markers.isNotEmpty) {
        _markers.clear();
      }
      _markers.add(
        Marker(
          point: position,
          child: mapIcon,
        ),
      );
      _showError = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bool isConnected = ref.watch(connectivityProvider);
    final locationViewModel = ref.watch(locationProvider.notifier);
    final divingNotifier = ref.read(divingNotifierProvider.notifier);
    final divingProviderAsync = ref.watch(divingNotifierProvider);
    final fishListAsync = ref.read(fishRepositoryProvider);
    late Diving newDiving;

    void createDiving() {
      DateTime date =
          dateFormat.parse(_dateTimeController.text);
      int maxDepth = int.parse(_depthController.text);
      int maxDurationDepth = int.parse(_maxDurationDepthController.text);
      double temperature = double.parse(_temperatureController.text);
      Duration duration =
          Duration(minutes: int.parse(_durationController.text));
      String city = _areaController.text;
      String province = _provinceController.text;
      String divingSchool = _schoolController.text;
      LatLng position = _divingPosition!;
      SoilType soilType = _soilType!;
      List<FishItem> fishList = divingNotifier.getDiving().fishList;
      //String id = divingNotifier.getId();
      newDiving = Diving(
          id: '',
          position: position,
          divingSchool: divingSchool,
          city: city,
          province: province,
          date: date,
          maxDepth: maxDepth,
          maxDurationDepth: maxDurationDepth,
          temperature: temperature,
          duration: duration,
          soil: soilType,
          fishList: fishList);
      divingNotifier.setPrimaryData(newDiving);
      /* ref.read(divingProvider.notifier).setPrimaryData(position, school, city,
          province, date, maxDepth, temperature, duration); */
    }

    List<FxStep> steps = [
      FxStep(
        title: const Text('Diving position', style: TextStyle(color: kYellow)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: _markers.isEmpty
                  ? () {
                      if (!isConnected) {
                        locationViewModel.getUserLocation();
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => MapScreen(
                            onTap: tapMap,
                          ),
                        ),
                      );
                    }
                  : () {
                      setState(() {
                        _markers.clear();
                        _divingPosition = null;
                      });
                    },
              child: ClipRRect(
                //color: kGrey,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      MapScreen(markers: _markers),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_showError)
              const Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Inserire posizione prima di continuare',
                    style: TextStyle(color: Color.fromRGBO(255, 124, 114, 1)),
                  ),
                ],
              ),
            if (_divingPosition != null)
              Column(
                children: [
                  const SizedBox(height: 15),
                  TextBorder(
                    title: 'Position: ',
                    text:
                        'Lat: ${_divingPosition!.latitude}, Lan: ${_divingPosition!.longitude}',
                  ),
                ],
              ),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      FxStep(
        title: Text('Diving conditions',
            style: TextStyle(color: _currentStep >= 1 ? kYellow : kBlueGrey)),
        content: Form(
          key: formKey,
          child: Column(
            children: [
              SurveyTextField(
                  controller: _schoolController, label: 'Diving school'),
              SurveyTextField(
                  controller: _areaController, label: 'Closest populated area'),
              SurveyTextField(
                  controller: _provinceController, label: 'Province'),
              SurveyTextField(
                  label: 'Date and time',
                  controller: _dateTimeController,
                  datePicker: true),
              SurveyTextField(
                  controller: _depthController,
                  label: 'Maximum depth',
                  isNumber: true),
              SurveyTextField(
                  controller: _maxDurationDepthController,
                  label: 'Depth of maximum permanence',
                  isNumber: true),
              SurveyTextField(
                  controller: _temperatureController,
                  label: 'Water temperature',
                  isNumber: true),
              SurveyTextField(
                  controller: _durationController,
                  label: 'Duration (in minutes)',
                  isNumber: true),
              Row(
                children: [
                  const Text('Select a soil:'),

                  // Spazio tra il testo e i radio buttons
                  const SizedBox(width: 16),
                  // Primo radio button
                  Radio<SoilType>(
                    value: SoilType.sandy,
                    groupValue: _soilType,
                    onChanged: (SoilType? valore) {
                      setState(() {
                        _soilType = valore;
                      });
                    },
                  ),
                  const Text('sandy'),

                  // Secondo radio button
                  Radio<SoilType>(
                    value: SoilType.rocky,
                    groupValue: _soilType,
                    onChanged: (SoilType? valore) {
                      setState(() {
                        _soilType = valore;
                      });
                    },
                  ),
                  const Text('rocky'),

                  // Terzo radio button
                  Radio<SoilType>(
                    value: SoilType.other,
                    groupValue: _soilType,
                    onChanged: (SoilType? valore) {
                      setState(() {
                        _soilType = valore;
                      });
                    },
                  ),
                  const Text('other'),
                ],
              ),
            ],
          ),
        ),
        isActive: _currentStep >= 1,
      ),
      FxStep(
        title: Text('Fish seen',
            style: TextStyle(color: _currentStep >= 2 ? kYellow : kBlueGrey)),
        content: fishListAsync.when(
          data: (repo) {
            List<Fish> fishList = repo.getFishList();
            return DivingFishPage(fishList: fishList);
          },
          error: (err, stack) => Center(child: Text('Error: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
        isActive: _currentStep >= 2,
      ),
      FxStep(
        title: Text(
          'Resume',
          style: TextStyle(color: _currentStep >= 3 ? kYellow : kBlueGrey),
        ),
        content: divingProviderAsync.when(
          data: (diving) {
            newDiving = diving;
            return DivingInformationSurvey(diving: newDiving);
          },
          error: (err, stack) => Center(child: Text('Error: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    ];

    return MyScaffold(
      title: 'New diving',
      padding: false,
      body: Theme(
        data: ThemeData(
          canvasColor: kDarkBlue,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: kYellow,
                secondary: kYellow,
              ),
        ),
        child: FxStepper(
          type: FxStepperType.horizontal,
          steps: steps,
          currentStep: _currentStep,
          controlsBuilder: (context, details) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kLightDarkBlue,
                      ),
                      onPressed: details.onStepCancel,
                      child: const Text('Back'),
                    ),
                    const SizedBox(width: 10),
                    if (_currentStep < 3)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kLightDarkBlue,
                        ),
                        onPressed: details.onStepContinue,
                        child: const Text('Next'),
                      ),
                  ],
                ),
              ),
              if (_currentStep == 3)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kLightDarkBlue,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(newDiving);
                    //dispose();
                    //!AGGIUNGERE UN EVENTUALE RESET DELL'AUSILIARY FISH LIST!
                  },
                  child: const Text('Save'),
                ),
            ],
          ),
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep--;
              });
            } else {
              Navigator.of(context).pop();
            }
          },
          onStepContinue: () {
            final isLastStep = _currentStep == 3;
            if (_currentStep == 0) {
              if (_divingPosition == null) {
                setState(() {
                  _showError = true;
                });
              } else {
                setState(() {
                  _currentStep++;
                });
              }
            } else {
              if (formKey.currentState!.validate()) {
                // Save the item
                formKey.currentState!.save();
                FocusManager.instance.primaryFocus?.unfocus();
                if (_currentStep == 2) {
                  createDiving();
                }
                if (!isLastStep) {
                  setState(() {
                    _currentStep++;
                  });
                }
              }
            }
          },
          onStepTapped: (value) => _currentStep > 1
              ? setState(() {
                  _currentStep = value;
                })
              : null,
        ),
      ),
    );
  }
}
