.class Lcom/east2west/game/QinConst$1$1;
.super Ljava/lang/Object;
.source "QinConst.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/east2west/game/QinConst$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/east2west/game/QinConst$1;


# direct methods
.method constructor <init>(Lcom/east2west/game/QinConst$1;)V
    .locals 0

    .line 435
    iput-object p1, p0, Lcom/east2west/game/QinConst$1$1;->this$1:Lcom/east2west/game/QinConst$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 442
    iget-object v0, p0, Lcom/east2west/game/QinConst$1$1;->this$1:Lcom/east2west/game/QinConst$1;

    iget-object v0, v0, Lcom/east2west/game/QinConst$1;->val$inputServer:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 443
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/east2west/game/QinConst;->New_accesstoken:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 444
    invoke-static {v1}, Lcom/east2west/game/QinConst;->access$000(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 445
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "appid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/east2west/game/QinConst;->New_appid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "&cdkey="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "&sign="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http://101.200.214.15/wk/e2wcdkey/public/index.php/createcdkey/index/use_key "

    .line 447
    invoke-static {v1, v0}, Lcom/east2west/game/QinConst;->postDownloadJson(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 448
    new-instance v1, Lorg/json/JSONTokener;

    invoke-direct {v1, v0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 452
    :try_start_0
    invoke-virtual {v1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    const-string v1, "code"

    .line 453
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "IAP"

    .line 454
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "errorcodeString="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "0"

    .line 455
    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "msg"

    .line 458
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 459
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_3

    .line 463
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 464
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 465
    invoke-virtual {v5}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .line 466
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 468
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 469
    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 470
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v7, :cond_0

    .line 473
    iget-object v9, p0, Lcom/east2west/game/QinConst$1$1;->this$1:Lcom/east2west/game/QinConst$1;

    iget-object v9, v9, Lcom/east2west/game/QinConst$1;->val$inbase:Lcom/east2west/game/inApp/InAppBase;

    sget-object v9, Lcom/east2west/game/inApp/InAppBase;->appinterface:Lcom/east2west/game/inApp/APPBaseInterface;

    invoke-interface {v9, v6}, Lcom/east2west/game/inApp/APPBaseInterface;->onFunctionCallBack(Ljava/lang/String;)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 481
    :cond_2
    iget-object v0, p0, Lcom/east2west/game/QinConst$1$1;->this$1:Lcom/east2west/game/QinConst$1;

    iget-object v0, v0, Lcom/east2west/game/QinConst$1;->val$inbase:Lcom/east2west/game/inApp/InAppBase;

    sget-object v0, Lcom/east2west/game/inApp/InAppBase;->appinterface:Lcom/east2west/game/inApp/APPBaseInterface;

    const-string v1, "ExchangeFailed"

    invoke-interface {v0, v1}, Lcom/east2west/game/inApp/APPBaseInterface;->onFunctionCallBack(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 488
    iget-object v1, p0, Lcom/east2west/game/QinConst$1$1;->this$1:Lcom/east2west/game/QinConst$1;

    iget-object v1, v1, Lcom/east2west/game/QinConst$1;->val$inbase:Lcom/east2west/game/inApp/InAppBase;

    sget-object v1, Lcom/east2west/game/inApp/InAppBase;->appinterface:Lcom/east2west/game/inApp/APPBaseInterface;

    const-string v2, ""

    invoke-interface {v1, v2}, Lcom/east2west/game/inApp/APPBaseInterface;->onPurchaseFailedCallBack(Ljava/lang/String;)V

    .line 489
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_3
    :goto_2
    return-void
.end method
