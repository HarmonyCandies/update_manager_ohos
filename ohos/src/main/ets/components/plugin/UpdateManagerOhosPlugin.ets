import {
  AbilityAware,
  AbilityPluginBinding,
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
} from '@ohos/flutter_ohos'
import { updateManager } from '@kit.StoreKit';
import { common } from '@kit.AbilityKit';

const MESSAGE_CHANNEL = "com.fluttercandies/update_manager_ohos";

export default class UpdateManagerOhosPlugin implements FlutterPlugin, MethodCallHandler, AbilityAware {
  private channel: MethodChannel | null = null;
  private context: common.UIAbilityContext | null = null;

  getUniqueClassName(): string {
    return "UpdateManagerOhosPlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.channel = new MethodChannel(binding.getBinaryMessenger(), MESSAGE_CHANNEL);
    this.channel.setMethodCallHandler(this)
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    if (this.channel != null) {
      this.channel.setMethodCallHandler(null)
    }
  }

  onAttachedToAbility(binding: AbilityPluginBinding): void {
    this.context = binding.getAbility().context;
  }

  onDetachedFromAbility(): void {
    this.context = null;
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    if (call.method == "checkUpdate") {
      this.checkUpdate(result)
    } else if (call.method == "showUpdateDialog") {
      this.showUpdateDialog(result)
    } else {
      result.notImplemented()
    }
  }

  async checkUpdate(result: MethodResult) {
    const checkResult = await updateManager.checkAppUpdate(this.context);
    const hasUpdate = checkResult.updateAvailable == updateManager.UpdateAvailableCode.LATER_VERSION_EXIST;
    result.success(hasUpdate);
  }

  async showUpdateDialog(result: MethodResult) {
    const showResult = await updateManager.showUpdateDialog(this.context);
    const didShow = showResult == updateManager.ShowUpdateResultCode.SHOW_DIALOG_SUCCESS;
    result.success(didShow);
  }
}