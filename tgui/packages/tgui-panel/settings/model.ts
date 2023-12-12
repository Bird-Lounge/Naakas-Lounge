/**
 * @file
 */
import { createUuid } from 'common/uuid';

export const createHighlightSetting = (obj?: Record<string, any>) => ({
  id: createUuid(),
  highlightText: '',
  highlightColor: '#aaff00', // NAAKAS-LOUNGE EDIT
  highlightWholeMessage: true,
  matchWord: false,
  matchCase: false,
  ...obj,
});

export const createDefaultHighlightSetting = (obj?: Record<string, any>) =>
  createHighlightSetting({
    id: 'default',
    ...obj,
  });
