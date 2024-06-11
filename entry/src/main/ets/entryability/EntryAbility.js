import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
const TAG = '[Example].[Entry].[EntryAbility]';
export default class EntryAbility extends UIAbility {
    constructor() {
        super(...arguments);
        this.storage = new LocalStorage({ 'PropA': 49 });
    }
    onCreate(want, launchParam) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
        globalThis.entryAbilityWant = want;
        let eventHub = this.context.eventHub;
        eventHub.on('event1', this.func1);
        // eventHub.on('event1', (....data) => {
        //   console.info(TAG, '2.' + JSON.stringify(data))
        // })
    }
    func1(...data) {
        console.info(TAG, '1.' + JSON.stringify(data));
    }
    onDestroy() {
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    }
    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
        windowStage.loadContent('pages/Index', this.storage, (err, data) => {
            var _a, _b;
            if (err.code) {
                hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', (_a = JSON.stringify(err)) !== null && _a !== void 0 ? _a : '');
                return;
            }
            hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', (_b = JSON.stringify(data)) !== null && _b !== void 0 ? _b : '');
        });
    }
    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    }
    onForeground() {
        // Ability has brought to foreground
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    }
    onBackground() {
        // Ability has back to background
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    }
    onNewWant() {
    }
}
//# sourceMappingURL=EntryAbility.js.map