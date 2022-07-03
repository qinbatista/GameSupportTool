.class public Lcom/east2west/game/E2WApp;
.super Ljava/lang/Object;
.source "E2WApp.java"


# static fields
.field public static ChannelForServer:Ljava/lang/String; = null

.field public static DeviceId:Ljava/lang/String; = ""

.field public static LongChannelID:Ljava/lang/String; = ""

.field public static Platform:I = -0x1

.field public static SavePidName:Ljava/lang/String; = ""

.field public static SortChannelID:Ljava/lang/String; = ""

.field public static activityforappbase:Lcom/east2west/game/E2WApp; = null

.field private static img:Landroid/widget/ImageView; = null

.field public static isLogOpen:Ljava/lang/String; = ""

.field public static mContext:Landroid/content/Context;

.field public static mSimOperatorId:I

.field public static nikeString:Ljava/lang/String;

.field public static packagenameforuse:Ljava/lang/String;


# instance fields
.field private mChannelId:I

.field private mExtSDKId:I

.field private mInApp:Lcom/east2west/game/inApp/InAppBase;

.field private mInAppExt:Lcom/east2west/game/inApp/InAppBase;

.field public mInAppShow:Lcom/east2west/game/inApp/InAppBase;

.field private mInShare:Lcom/east2west/game/inApp/InAppBase;

.field public platform:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 46
    iput v0, p0, Lcom/east2west/game/E2WApp;->mExtSDKId:I

    return-void
.end method

.method private GetmInAppExt()V
    .locals 2

    .line 345
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp] GetmInAppExt()->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/east2west/game/E2WApp;->mExtSDKId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 346
    iget v0, p0, Lcom/east2west/game/E2WApp;->mExtSDKId:I

    return-void
.end method

.method public static LogLocal(Ljava/lang/String;)V
    .locals 1

    .line 462
    sget-object v0, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static synthetic access$000(Lcom/east2west/game/E2WApp;)Lcom/east2west/game/inApp/InAppBase;
    .locals 0

    .line 36
    iget-object p0, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    return-object p0
.end method

.method public static getInstance()Ljava/lang/Object;
    .locals 2

    const-string v0, "IAP"

    const-string v1, "Unity Game"

    .line 303
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    sget v0, Lcom/east2west/game/QinConst;->Unity:I

    sput v0, Lcom/east2west/game/E2WApp;->Platform:I

    .line 305
    sget-object v0, Lcom/east2west/game/E2WApp;->mContext:Landroid/content/Context;

    return-object v0
.end method


# virtual methods
.method public ChannelSplash()V
    .locals 4

    const-string v0, "[inapp] ChannelSplash.png"

    .line 73
    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 75
    :try_start_0
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const-string v1, "ChannelSplash.png"

    .line 79
    sget-object v2, Lcom/east2west/game/E2WApp;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 81
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 83
    sget-object v2, Lcom/east2west/game/E2WApp;->mContext:Landroid/content/Context;

    check-cast v2, Landroid/app/Activity;

    new-instance v3, Lcom/east2west/game/E2WApp$1;

    invoke-direct {v3, p0, v1, v0}, Lcom/east2west/game/E2WApp$1;-><init>(Lcom/east2west/game/E2WApp;Landroid/graphics/Bitmap;Landroid/widget/RelativeLayout$LayoutParams;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 117
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 118
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[inapp] init e="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public Exchange()V
    .locals 2

    .line 324
    new-instance v0, Landroid/os/Handler;

    sget-object v1, Lcom/east2west/game/E2WApp;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/east2west/game/E2WApp$3;

    invoke-direct {v1, p0}, Lcom/east2west/game/E2WApp$3;-><init>(Lcom/east2west/game/E2WApp;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public Exchange(Lcom/east2west/game/inApp/APPBaseInterface;)V
    .locals 1

    .line 335
    new-instance p1, Landroid/os/Handler;

    sget-object v0, Lcom/east2west/game/E2WApp;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Lcom/east2west/game/E2WApp$4;

    invoke-direct {v0, p0}, Lcom/east2west/game/E2WApp$4;-><init>(Lcom/east2west/game/E2WApp;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public ExitGame()V
    .locals 2

    .line 153
    new-instance v0, Landroid/os/Handler;

    sget-object v1, Lcom/east2west/game/E2WApp;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/east2west/game/E2WApp$2;

    invoke-direct {v1, p0}, Lcom/east2west/game/E2WApp$2;-><init>(Lcom/east2west/game/E2WApp;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public InitCarriers(Lcom/east2west/game/inApp/APPBaseInterface;)V
    .locals 0

    return-void
.end method

.method public InitChannel(Lcom/east2west/game/inApp/APPBaseInterface;)V
    .locals 7

    .line 135
    sget-object v0, Lcom/east2west/game/E2WApp;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp] Local InitChannel()->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 137
    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    sget-object v0, Lcom/east2west/game/E2WApp;->mContext:Landroid/content/Context;

    move-object v3, v0

    check-cast v3, Landroid/app/Activity;

    sget-object v4, Lcom/east2west/game/QinConst;->APPID:Ljava/lang/String;

    sget-object v5, Lcom/east2west/game/QinConst;->APPKEY:Ljava/lang/String;

    move-object v6, p1

    invoke-virtual/range {v1 .. v6}, Lcom/east2west/game/inApp/InAppBase;->init(Landroid/content/Context;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/east2west/game/inApp/APPBaseInterface;)V

    return-void
.end method

.method public InitE2WSDK(Landroid/content/Context;)V
    .locals 0

    .line 63
    sput-object p1, Lcom/east2west/game/E2WApp;->mContext:Landroid/content/Context;

    .line 64
    invoke-virtual {p0}, Lcom/east2west/game/E2WApp;->ChannelSplash()V

    const-string p1, ""

    .line 65
    invoke-static {p1}, Lcom/east2west/game/QinConst;->GetChannelID(Ljava/lang/String;)V

    .line 66
    new-instance p1, Lcom/east2west/game/inApp/InAppDefault;

    invoke-direct {p1}, Lcom/east2west/game/inApp/InAppDefault;-><init>()V

    iput-object p1, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    .line 67
    new-instance p1, Lcom/east2west/game/inApp/InAppDefault;

    invoke-direct {p1}, Lcom/east2west/game/inApp/InAppDefault;-><init>()V

    iput-object p1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    .line 68
    sput-object p0, Lcom/east2west/game/E2WApp;->activityforappbase:Lcom/east2west/game/E2WApp;

    return-void
.end method

.method public LongChannelID()Ljava/lang/String;
    .locals 1

    .line 169
    sget-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    return-object v0
.end method

.method public Message(Ljava/lang/String;)V
    .locals 2

    .line 354
    sget-object v0, Lcom/east2west/game/E2WApp;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public SavePidName()Ljava/lang/String;
    .locals 5

    .line 124
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMddHHmmss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 125
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 127
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v1

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    add-double/2addr v1, v3

    const-wide v3, 0x40f86a0000000000L    # 100000.0

    mul-double v1, v1, v3

    double-to-int v1, v1

    .line 128
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public SharePicture(Ljava/lang/String;ZLcom/east2west/game/inApp/APPBaseInterface;)V
    .locals 0

    return-void
.end method

.method public ShortChannelID()Ljava/lang/String;
    .locals 1

    .line 165
    sget-object v0, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    return-object v0
.end method

.method public ShowTencentAd()V
    .locals 2

    .line 422
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp]->ShowTencentAd:mInAppExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 423
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 425
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->ShowTencentAd()V

    :cond_0
    return-void
.end method

.method public TencentLogin(I)V
    .locals 2

    .line 398
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp]->TencentLogin:mInAppExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " kind="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 399
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 401
    invoke-virtual {v0, p1}, Lcom/east2west/game/inApp/InAppBase;->login(I)V

    :cond_0
    return-void
.end method

.method public TencentLoginOut()V
    .locals 2

    .line 406
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp]->TencentLoginOut:mInAppExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 407
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 409
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->logout()V

    :cond_0
    return-void
.end method

.method public TencentLoginOutOnly()V
    .locals 2

    .line 414
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp]->TencentLoginOutOnly:mInAppExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 415
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 417
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->TencentLoginOutOnly()V

    :cond_0
    return-void
.end method

.method public getBaseInApp()Lcom/east2west/game/inApp/InAppBase;
    .locals 2

    .line 315
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp] getBaseInApp()->mInApp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 316
    new-instance v0, Lcom/east2west/game/inApp/InAppDefault;

    invoke-direct {v0}, Lcom/east2west/game/inApp/InAppDefault;-><init>()V

    return-object v0
.end method

.method public getChannelId()I
    .locals 1

    .line 310
    iget v0, p0, Lcom/east2west/game/E2WApp;->mChannelId:I

    return v0
.end method

.method public letUserLogin()V
    .locals 2

    .line 365
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp]->letUserLogin:mInAppExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 366
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 368
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->letUserLogin()V

    :cond_0
    return-void
.end method

.method public letUserLogout()V
    .locals 2

    .line 381
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp]->letUserLogout:mInAppExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 382
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 384
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->letUserLogout()V

    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 446
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp]->onActivityResult:mInAppExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 447
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 449
    invoke-virtual {v0, p1, p2, p3}, Lcom/east2west/game/inApp/InAppBase;->onActivityResult(IILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 288
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 290
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onDestroy()V

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_1

    .line 295
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onDestroy()V

    :cond_1
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 454
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp]->onNewIntent:mInAppExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 455
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 457
    invoke-virtual {v0, p1}, Lcom/east2west/game/inApp/InAppBase;->onNewIntent(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 226
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 228
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onPause()V

    .line 231
    :cond_0
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_1

    .line 233
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onPause()V

    :cond_1
    return-void
.end method

.method public onRestart()V
    .locals 1

    .line 262
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 264
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onRestart()V

    .line 267
    :cond_0
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_1

    .line 269
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onRestart()V

    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 275
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 277
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onResume()V

    .line 280
    :cond_0
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_1

    .line 282
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onResume()V

    :cond_1
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 250
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 252
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onStart()V

    .line 255
    :cond_0
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_1

    .line 257
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onStart()V

    :cond_1
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 238
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 240
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onStop()V

    .line 243
    :cond_0
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_1

    .line 245
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->onStop()V

    :cond_1
    return-void
.end method

.method public purchaseProduct(Ljava/lang/String;)V
    .locals 3

    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp] purchaseProduct: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 148
    invoke-static {p1}, Lcom/east2west/game/QinConst;->PayInfo(Ljava/lang/String;)V

    .line 149
    iget-object p1, p0, Lcom/east2west/game/E2WApp;->mInApp:Lcom/east2west/game/inApp/InAppBase;

    sget-object v0, Lcom/east2west/game/QinConst;->QinPid:Ljava/lang/String;

    sget-object v1, Lcom/east2west/game/QinConst;->Qindesc:Ljava/lang/String;

    sget v2, Lcom/east2west/game/QinConst;->Qinpricefloat:F

    invoke-virtual {p1, v0, v1, v2}, Lcom/east2west/game/inApp/InAppBase;->purchase(Ljava/lang/String;Ljava/lang/String;F)V

    return-void
.end method

.method public repairindentRequest()V
    .locals 0

    return-void
.end method

.method public respondCPserver()V
    .locals 0

    return-void
.end method

.method public showDiffLogin()V
    .locals 2

    .line 389
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp]->showDiffLogin:mInAppExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 390
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 392
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->showDiffLogin()V

    :cond_0
    return-void
.end method

.method public showMessageDialog()V
    .locals 2

    .line 438
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp]->showMessageDialog:mInAppExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 439
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 441
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->showMessageDialog()V

    :cond_0
    return-void
.end method

.method public show_banner()V
    .locals 1

    .line 176
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppShow:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 178
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->show_banner()V

    :cond_0
    return-void
.end method

.method public show_insert()V
    .locals 1

    .line 190
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppShow:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 192
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->show_insert()V

    :cond_0
    return-void
.end method

.method public show_out()V
    .locals 1

    .line 204
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppShow:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 206
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->show_out()V

    :cond_0
    return-void
.end method

.method public show_push()V
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppShow:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 199
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->show_push()V

    :cond_0
    return-void
.end method

.method public show_video()V
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppShow:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 213
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->show_video()V

    :cond_0
    return-void
.end method

.method public stopWaiting()V
    .locals 2

    .line 373
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[E2WApp]->stopWaiting:mInAppExt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/east2west/game/E2WApp;->LogLocal(Ljava/lang/String;)V

    .line 374
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 376
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->stopWaiting()V

    :cond_0
    return-void
.end method

.method public swtichuser()V
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppShow:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 185
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->swtichuser()V

    :cond_0
    return-void
.end method

.method public uploadclick()V
    .locals 1

    .line 218
    iget-object v0, p0, Lcom/east2west/game/E2WApp;->mInAppShow:Lcom/east2west/game/inApp/InAppBase;

    if-eqz v0, :cond_0

    .line 220
    invoke-virtual {v0}, Lcom/east2west/game/inApp/InAppBase;->uploadclick()V

    :cond_0
    return-void
.end method
