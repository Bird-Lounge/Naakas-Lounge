// THIS IS A NOVA SECTOR UI FILE
import { CheckboxInput, FeatureToggle } from '../../base';

export const erp_enable_belly: FeatureToggle = {
  name: 'Show/Hide Belly Preferences',
  category: 'BELLY',
  description: 'This shows/hides belly-kink content specific preferences.',
  component: CheckboxInput,
};

export const erp_belly_base: FeatureToggle = {
  name: 'Belly Base Preference',
  category: 'BELLY',
  description: 'Baseline belly debug pref.  Does nothing.',
  component: CheckboxInput,
};

export const erp_belly_sound_groans: FeatureToggle = {
  name: 'Hear Belly Sound: Full Groans',
  category: 'BELLY',
  description: 'When enabled, allows you to hear the groans from a full belly.',
  component: CheckboxInput,
};

export const erp_belly_sound_gurgles: FeatureToggle = {
  name: 'Hear Belly Sound: Stuffed Gurgles',
  category: 'BELLY',
  description:
    'When enabled, allows you to hear the gurgles from a stuffed belly.',
  component: CheckboxInput,
};

export const erp_belly_sound_move_creaks: FeatureToggle = {
  name: 'Hear Belly Sound: Full Movement Creaks',
  category: 'BELLY',
  description:
    'When enabled, allows you to hear the creaks from a full belly being jostled by movement.',
  component: CheckboxInput,
};

export const erp_belly_sound_move_sloshes: FeatureToggle = {
  name: 'Hear Belly Sound: Stuffed Movement Sloshes',
  category: 'BELLY',
  description:
    'When enabled, allows you to hear the sloshes from a stuffed belly being jostled by movement.',
  component: CheckboxInput,
};
