___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "ShinyStat Analytics - Events tracking",
  "categories": ["ANALYTICS"],
  "brand": {
    "id": "brand_dummy",
    "displayName": "",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAABhGlDQ1BJQ0MgcHJvZmlsZQAAKJF9kT1Iw0AcxV9TRS0VQYuIOGSoThZERRylikWwUNoKrTqYXPoFTRqSFBdHwbXg4Mdi1cHFWVcHV0EQ/ABxdHJSdJES/5cUWsR4cNyPd/ced+8AoV5mqtkxAaiaZSRjUTGTXRW7XiGgHz0IYFBiph5PLabhOb7u4ePrXYRneZ/7c/QqOZMBPpF4jumGRbxBPLNp6Zz3iUOsKCnE58TjBl2Q+JHrsstvnAsOCzwzZKST88QhYrHQxnIbs6KhEk8ThxVVo3wh47LCeYuzWq6y5j35C4M5bSXFdZojiGEJcSQgQkYVJZRhIUKrRoqJJO1HPfzDjj9BLplcJTByLKACFZLjB/+D392a+alJNykYBTpfbPtjFOjaBRo12/4+tu3GCeB/Bq60lr9SB2Y/Sa+1tPAR0LcNXFy3NHkPuNwBhp50yZAcyU9TyOeB9zP6piwwcAsE1tzemvs4fQDS1NXyDXBwCIwVKHvd493d7b39e6bZ3w8nu3KJp2IRqAAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEgAACxIB0t1+/AAAAAd0SU1FB+YCEgkMOXB4YsAAAAAZdEVYdENvbW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAABb0lEQVR42u3asUrDQBzH8d+1MYkVahFawSIOopu4uxVxEcTFSR/BRZ/ByYLv4Dv4CkJB9AWcREWwgha01hZ751AhOF10kJJ8/8tl+N+QD7/c5UKMc84px1VQzgsAAAAAAAAAAAAAAAByWkH2bint2c78BHDdrvoXrRTTjKLG+tjevr3Zl+yzP/pzJ1JcTwDse1f9o4MUmYkUNa7GNwC2I9nHFDmxMqwBAAAAAO8B/7lDv7blei/+rTauyJRnswcwvGvJXjf9sVw8VLCywyMw9gmw7Xtp+OmP9ExNJiplD2Bw1pR7uvT2hXunKs4vswsAAADfA35XHx25h3N/XzGSWdjIIMDgTe722N8XLv0ZgDUAAAAAAAAAAAAAAAAAAMj3cdgEEypu7qYgS8wK9VW56bp3igknR2OpKlPd9vdP1b6PuaFU2fL3B+XkOl6Tsz3/HBONRn6WZg0AAAAAAAAAAAAAAAAAAAAAAAAAAMhXfQGZYEguLPOibAAAAABJRU5ErkJggg\u003d\u003d"
  },
  "description": "This template allows to track an event through the ShinyStat Analytics system with GTM. Find more info on ShinyStat Analytics at https://www.shinystat.com",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "category",
    "displayName": "Category",
    "simpleValueType": true,
    "help": "Enter the category to which the events belongs to.",
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^[a-zA-Z0-9-]+$"
        ]
      },
      {
        "type": "STRING_LENGTH",
        "args": [
          3,
          50
        ]
      }
    ],
    "notSetText": "Although this is not strictly mandatory, we recommend to always fill out the category as this is the main subdivision in the events reports.",
    "canBeEmptyString": true
  },
  {
    "type": "TEXT",
    "name": "action",
    "displayName": "Action",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^[a-zA-Z0-9-]+$"
        ]
      },
      {
        "type": "STRING_LENGTH",
        "args": [
          3,
          50
        ]
      }
    ],
    "help": "Enter the action name for this event.",
    "canBeEmptyString": true
  },
  {
    "type": "TEXT",
    "name": "label",
    "displayName": "Label",
    "simpleValueType": true,
    "help": "Insert a short description for the event.",
    "valueValidators": [
      {
        "type": "REGEX",
        "args": [
          "^[a-zA-Z0-9-]+$"
        ]
      },
      {
        "type": "STRING_LENGTH",
        "args": [
          3,
          50
        ]
      }
    ],
    "canBeEmptyString": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const logToConsole = require('logToConsole');
const copyFromWindow = require('copyFromWindow');

const log = (message) => {
  logToConsole('ShinyStat for GTM:', message);
};

const onSuccess = () => {
  log('Loaded successfully.');
  data.gtmOnSuccess();
};

const onFailure = () => {
  log('Loading failed.');
  data.gtmOnFailure();
};

let ssxl;

const send_event = function(fn, data) {
  fn('SS_EVENT=' + data.category + '&SS_EV_ACT=' + data.action + '&SS_EV_DESC=' + data.label);
  onSuccess();
};

const process_event = function() {
  ssxl = copyFromWindow('ssxl');
  if (typeof ssxl == 'function') {
    log('ssxl found.');
    send_event(ssxl, data);
  } else {
    log('ssxl not found.');
    onFailure();
  }
};

log('starting event processing...');
process_event();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "ssxl"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: test 1
  code: |-
    const mockData = {
      category: 'category-test',
      action: 'action-test',
      label: 'label-test'
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 24/3/2023, 10:52:05


