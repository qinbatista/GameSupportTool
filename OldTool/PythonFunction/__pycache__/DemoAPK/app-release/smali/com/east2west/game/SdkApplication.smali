.class public Lcom/east2west/game/SdkApplication;
.super Landroid/app/Application;
.source "SdkApplication.java"


# static fields
.field public static Acontext:Landroid/app/Application; = null

.field public static channelSplash:Ljava/lang/String; = "1"

.field public static channelname:Ljava/lang/String; = ""

.field public static e2wnumber:Ljava/lang/String; = ""

.field public static isAntLogOpen:Ljava/lang/String; = ""

.field public static iscarriersneed:Ljava/lang/String; = "1"

.field public static jschannel:Ljava/lang/String; = ""

.field public static jsid:Ljava/lang/String; = ""

.field public static jstjid:Ljava/lang/String; = ""

.field public static key:Ljava/lang/String; = ""

.field private static mChannelId:I = -0x1

.field private static mExtSDKId:I = -0x1

.field public static mSimOperatorId:I = 0x0

.field public static msg:Ljava/lang/String; = ""


# instance fields
.field public mInApp:Lcom/east2west/game/inApp/InAppBase;

.field private mInAppExt:Lcom/east2west/game/inApp/InAppBase;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method private checkChannel()V
    .locals 4

    .line 203
    :try_start_0
    sget-object v0, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget-object v1, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 204
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "EGAME_CHANNEL"

    .line 205
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/east2west/game/SdkApplication;->mChannelId:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 210
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkChannel:Failed to load meta-data, EGAME_CHANNEL NullPointer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, -0x1

    .line 211
    sput v0, Lcom/east2west/game/SdkApplication;->mChannelId:I

    goto :goto_0

    :catch_1
    move-exception v0

    .line 207
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkChannel:Failed to load meta-data, EGAME_CHANNEL NameNotFound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 208
    sput v0, Lcom/east2west/game/SdkApplication;->mChannelId:I

    :goto_0
    return-void
.end method

.method private checkChannelName()V
    .locals 8

    const-string v0, "e2wwk"

    const-string v1, "qihu360"

    const-string v2, "anzhi"

    const-string v3, "jinli"

    const-string v4, "meitu"

    .line 220
    :try_start_0
    sget-object v5, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v5}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    sget-object v6, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v6}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x80

    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v5

    .line 221
    iget-object v5, v5, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v6, "CHANNEL_NAME"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 222
    sput-object v5, Lcom/east2west/game/SdkApplication;->channelname:Ljava/lang/String;

    sput-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    .line 223
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "kp"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v0, "kupai"

    .line 225
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 227
    :cond_0
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "txyysc"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v0, "tengxunyingyongshichang"

    .line 229
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 231
    :cond_1
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "txyxzx"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v0, "tengxunyouxizhongxin"

    .line 233
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 235
    :cond_2
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "dxx"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v0, "xuancaiweimi"

    .line 237
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 239
    :cond_3
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "bf"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    const-string v0, "baofengyingyin"

    .line 241
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 243
    :cond_4
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "txllq"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    const-string v0, "tengxunliulanqi"

    .line 245
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 247
    :cond_5
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "al"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    const-string v0, "ali"

    .line 249
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 251
    :cond_6
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "unicom"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const-string v0, "liantong"

    .line 253
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 255
    :cond_7
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "mobile"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const-string v0, "yidong"

    .line 257
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 259
    :cond_8
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "qqgj"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    const-string v0, "QQguanjia"

    .line 261
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 263
    :cond_9
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "none"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    const-string v0, "kongxiangmu"

    .line 265
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 267
    :cond_a
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "telecom"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    const-string v0, "dianxin"

    .line 269
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 271
    :cond_b
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "debug"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    const-string v0, "ceshi"

    .line 273
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 275
    :cond_c
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "yy"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    const-string v0, "youyi"

    .line 277
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 279
    :cond_d
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "nd"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    const-string v0, "Nduo"

    .line 281
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 283
    :cond_e
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "yyh"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    const-string v0, "yingyonghui"

    .line 285
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 287
    :cond_f
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "yk"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10

    const-string v0, "youku"

    .line 289
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 291
    :cond_10
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "jf"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11

    const-string v0, "jifeng"

    .line 293
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 295
    :cond_11
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "sg"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_12

    const-string v0, "sougou"

    .line 297
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 299
    :cond_12
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "txyyb"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    const-string v0, "tengxunyingyongbao"

    .line 301
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 303
    :cond_13
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "kw"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    const-string v0, "kuwo"

    .line 305
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 307
    :cond_14
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "aqy"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_15

    const-string v0, "aiqiyi"

    .line 309
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 311
    :cond_15
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "yw"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_16

    const-string v0, "yiwan"

    .line 313
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 315
    :cond_16
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "taptap"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_17

    const-string v0, "TapTap"

    .line 317
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 319
    :cond_17
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "mzw"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_18

    const-string v0, "muzhiwan"

    .line 321
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 323
    :cond_18
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v6, "dl"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    const-string v0, "dangle"

    .line 325
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 327
    :cond_19
    sget-object v5, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1a

    .line 329
    sput-object v4, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 331
    :cond_1a
    sget-object v4, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v5, "east2west"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const-string v0, "dongpinxishang"

    .line 333
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 335
    :cond_1b
    sget-object v4, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v5, "hw"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1c

    const-string v0, "huawei"

    .line 337
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 339
    :cond_1c
    sget-object v4, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v5, "lxlsd"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1d

    const-string v0, "lianxiangleshangdian"

    .line 341
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 343
    :cond_1d
    sget-object v4, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v5, "lxyx"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1e

    const-string v0, "lianxiangyouxi"

    .line 345
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 347
    :cond_1e
    sget-object v4, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v5, "chel_4399"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1f

    const-string v0, "4399"

    .line 349
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 351
    :cond_1f
    sget-object v4, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v5, "mz"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_20

    const-string v0, "meizu"

    .line 353
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 355
    :cond_20
    sget-object v4, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v5, "wdj"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_21

    const-string v0, "wandoujia"

    .line 357
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 359
    :cond_21
    sget-object v4, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v5, "ls"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_22

    const-string v0, "leshi"

    .line 361
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 363
    :cond_22
    sget-object v4, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_23

    .line 365
    sput-object v3, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 367
    :cond_23
    sget-object v3, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v4, "vivo"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_24

    const-string v0, "VIVO"

    .line 369
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 371
    :cond_24
    sget-object v3, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v4, "wxgame"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_25

    const-string v0, "weixinyouxi"

    .line 373
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 375
    :cond_25
    sget-object v3, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 377
    sput-object v2, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 379
    :cond_26
    sget-object v2, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v3, "baidu_dk"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    const-string v0, "baiduduoku"

    .line 381
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 383
    :cond_27
    sget-object v2, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v3, "xm"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    const-string v0, "xiaomi"

    .line 385
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 387
    :cond_28
    sget-object v2, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v3, "baidu_sjzs"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    const-string v0, "baidushoujizhushou"

    .line 389
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 391
    :cond_29
    sget-object v2, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v3, "oppo"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    const-string v0, "OPPO"

    .line 393
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 395
    :cond_2a
    sget-object v2, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v3, "baidu_91"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2b

    const-string v0, "baidu91"

    .line 397
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto/16 :goto_0

    .line 399
    :cond_2b
    sget-object v2, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 401
    sput-object v1, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto :goto_0

    .line 403
    :cond_2c
    sget-object v1, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v2, "baidu_tb"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    const-string v0, "baidutieba"

    .line 405
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto :goto_0

    .line 407
    :cond_2d
    sget-object v1, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v2, "UC"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    const-string v0, "UCjiuyou"

    .line 409
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;

    goto :goto_0

    .line 411
    :cond_2e
    sget-object v1, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 413
    sput-object v0, Lcom/east2west/game/E2WApp;->LongChannelID:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 420
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkChannelName:Failed to load meta-data, CHANNEL_NAME NullPointer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, -0x1

    .line 421
    sput v0, Lcom/east2west/game/SdkApplication;->mChannelId:I

    goto :goto_0

    :catch_1
    move-exception v0

    .line 417
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkChannelName:Failed to load meta-data, CHANNEL_NAME NotFound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    .line 418
    sput v0, Lcom/east2west/game/SdkApplication;->mChannelId:I

    :cond_2f
    :goto_0
    return-void
.end method

.method private checkChannelSplash()V
    .locals 4

    .line 446
    :try_start_0
    sget-object v0, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget-object v1, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 447
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "CHANNEL_SPLASH"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 448
    sput-object v0, Lcom/east2west/game/SdkApplication;->channelSplash:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 453
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkChannelSplash to load meta-data CHANNEL_SPLASH, NullPointer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    move-exception v0

    .line 450
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkChannelSplash to load meta-data CHANNEL_SPLASH, NameNotFound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method private checkExtJSCHANNELChannel()V
    .locals 5

    const-string v0, "game"

    const/4 v1, 0x0

    .line 553
    :try_start_0
    invoke-virtual {p0}, Lcom/east2west/game/SdkApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/east2west/game/SdkApplication;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v2

    .line 557
    :try_start_1
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 559
    :goto_0
    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v2, "JS_CHANNEL"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/east2west/game/SdkApplication;->jschannel:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 563
    :goto_1
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "3Failed to load meta-data, NameNotFound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    .line 569
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "4Failed to load meta-data, NullPointer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    return-void
.end method

.method private checkExtJSIDChannel()V
    .locals 5

    const-string v0, "game"

    const/4 v1, 0x0

    .line 526
    :try_start_0
    invoke-virtual {p0}, Lcom/east2west/game/SdkApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/east2west/game/SdkApplication;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v2

    .line 530
    :try_start_1
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 532
    :goto_0
    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v2, "JS_ID"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/east2west/game/SdkApplication;->jsid:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 536
    :goto_1
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "3Failed to load meta-data, NameNotFound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    .line 542
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "4Failed to load meta-data, NullPointer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    return-void
.end method

.method private checkExtJSTJIDChannel()V
    .locals 5

    const-string v0, "game"

    const/4 v1, 0x0

    .line 579
    :try_start_0
    invoke-virtual {p0}, Lcom/east2west/game/SdkApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p0}, Lcom/east2west/game/SdkApplication;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x80

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v2

    .line 583
    :try_start_1
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 585
    :goto_0
    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v2, "JS_TJID"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/east2west/game/SdkApplication;->jstjid:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 589
    :goto_1
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "3Failed to load meta-data, NameNotFound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v1

    .line 595
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "4Failed to load meta-data, NullPointer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    return-void
.end method

.method private checkExtSDK()V
    .locals 2

    .line 196
    sget-object v0, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    const-string v1, "[E2WApp] Default=ApplicationInit"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    new-instance v0, Lcom/east2west/game/inApp/InAppDefault;

    invoke-direct {v0}, Lcom/east2west/game/inApp/InAppDefault;-><init>()V

    iput-object v0, p0, Lcom/east2west/game/SdkApplication;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    .line 198
    iget-object v0, p0, Lcom/east2west/game/SdkApplication;->mInAppExt:Lcom/east2west/game/inApp/InAppBase;

    sget-object v1, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v0, v1}, Lcom/east2west/game/inApp/InAppBase;->ApplicationInit(Landroid/app/Application;)V

    return-void
.end method

.method private checkLoge()V
    .locals 4

    .line 462
    :try_start_0
    sget-object v0, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget-object v1, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 463
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "E2W_LOG"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 464
    sput-object v0, Lcom/east2west/game/SdkApplication;->isAntLogOpen:Ljava/lang/String;

    .line 465
    sget-object v0, Lcom/east2west/game/SdkApplication;->isAntLogOpen:Ljava/lang/String;

    const-string v1, "open"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "IAP"

    .line 467
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Log Verison:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/east2west/game/QinConst;->LogVERSION:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 473
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkLoge:Failed to load meta-data E2W_LOG, NullPointer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    move-exception v0

    .line 470
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkLoge:Failed to load meta-data E2W_LOG, NameNotFound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void
.end method

.method private checkMobileSplash()V
    .locals 4

    .line 430
    :try_start_0
    sget-object v0, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget-object v1, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 431
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "MOBILE_SPLASH"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 432
    sput-object v0, Lcom/east2west/game/SdkApplication;->iscarriersneed:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 437
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkMobileSplash:Failed to load meta-data MOBILE_SPLASH, NullPointer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    move-exception v0

    .line 434
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkMobileSplash:Failed to load meta-data MOBILE_SPLASH, NameNotFound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method private checkNumber()V
    .locals 4

    .line 482
    :try_start_0
    sget-object v0, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget-object v1, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 483
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "E2W_NUMBER"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 484
    sput-object v0, Lcom/east2west/game/SdkApplication;->e2wnumber:Ljava/lang/String;

    .line 485
    sget-object v0, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "E2W_NUMBER="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/east2west/game/SdkApplication;->e2wnumber:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 490
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkLoge:Failed to load meta-data E2W_NUMBER, NullPointer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    move-exception v0

    .line 487
    sget-object v1, Lcom/east2west/game/QinConst;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkLoge:Failed to load meta-data E2W_NUMBER, NameNotFound: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method private checkSIM()V
    .locals 3

    const/4 v0, 0x1

    .line 166
    sput v0, Lcom/east2west/game/SdkApplication;->mSimOperatorId:I

    .line 170
    :try_start_0
    sget-object v1, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    const-string v2, "phone"

    invoke-virtual {v1, v2}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 172
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    const-string v2, "46000"

    .line 175
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "46002"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "46007"

    .line 176
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    const-string v0, "46001"

    .line 178
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "46006"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "46009"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const-string v0, "46003"

    .line 180
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "46005"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "20404"

    .line 181
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_2
    const/4 v0, 0x3

    .line 182
    sput v0, Lcom/east2west/game/SdkApplication;->mSimOperatorId:I

    goto :goto_2

    :cond_3
    :goto_0
    const/4 v0, 0x2

    .line 179
    sput v0, Lcom/east2west/game/SdkApplication;->mSimOperatorId:I

    goto :goto_2

    .line 177
    :cond_4
    :goto_1
    sput v0, Lcom/east2west/game/SdkApplication;->mSimOperatorId:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 188
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_5
    :goto_2
    return-void
.end method

.method public static getChannelId()I
    .locals 1

    .line 507
    sget v0, Lcom/east2west/game/SdkApplication;->mChannelId:I

    return v0
.end method

.method public static getChannelname()Ljava/lang/String;
    .locals 1

    .line 511
    sget-object v0, Lcom/east2west/game/SdkApplication;->channelname:Ljava/lang/String;

    return-object v0
.end method

.method public static getExtSDKId()I
    .locals 1

    .line 502
    sget v0, Lcom/east2west/game/SdkApplication;->mExtSDKId:I

    return v0
.end method

.method private getSign(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 123
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    const/16 v0, 0x40

    .line 124
    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object p1

    .line 125
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 126
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 127
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/PackageInfo;

    .line 128
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    .line 129
    sget-object v2, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-virtual {v2}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 130
    iget-object p1, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v0, 0x0

    aget-object p1, p1, v0

    invoke-virtual {p1}, Landroid/content/pm/Signature;->toCharsString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public static getSimOperatorId()I
    .locals 1

    .line 497
    sget v0, Lcom/east2west/game/SdkApplication;->mSimOperatorId:I

    return v0
.end method


# virtual methods
.method public APPApplicationInit(Landroid/app/Application;)V
    .locals 1

    .line 85
    sput-object p1, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    const-string p1, ""

    .line 86
    invoke-static {p1}, Lcom/east2west/game/QinConst;->GetChannelID(Ljava/lang/String;)V

    .line 88
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkSIM()V

    .line 89
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkChannel()V

    .line 90
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkExtSDK()V

    .line 91
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkChannelName()V

    .line 92
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkMobileSplash()V

    .line 93
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkChannelSplash()V

    .line 94
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkLoge()V

    .line 95
    invoke-virtual {p0}, Lcom/east2west/game/SdkApplication;->JSXML()V

    .line 96
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkNumber()V

    .line 100
    :try_start_0
    sget-object p1, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    invoke-direct {p0, p1}, Lcom/east2west/game/SdkApplication;->getSign(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/east2west/game/SdkApplication;->key:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 105
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 108
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "[SDKApp]SdkName="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/east2west/game/SdkApplication;->msg:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "IAP"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    sget-object p1, Lcom/east2west/game/SdkApplication;->iscarriersneed:Ljava/lang/String;

    if-eqz p1, :cond_0

    const-string v0, "open"

    .line 112
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 114
    sget-object p1, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v0, "telecom"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v0, "unicom"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "megjb"

    .line 115
    invoke-static {p1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public JSXML()V
    .locals 0

    .line 515
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkExtJSIDChannel()V

    .line 516
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkExtJSCHANNELChannel()V

    .line 517
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkExtJSTJIDChannel()V

    return-void
.end method

.method public getSingInfo()V
    .locals 3

    .line 140
    :try_start_0
    invoke-virtual {p0}, Lcom/east2west/game/SdkApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    sget-object v1, Lcom/east2west/game/SdkApplication;->Acontext:Landroid/app/Application;

    .line 141
    invoke-virtual {v1}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x40

    .line 140
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 143
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v1, 0x0

    .line 144
    aget-object v0, v0, v1

    .line 145
    invoke-virtual {v0}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/east2west/game/SdkApplication;->parseSignature([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 147
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public onCreate()V
    .locals 2

    .line 51
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    const-string v0, ""

    .line 53
    invoke-static {v0}, Lcom/east2west/game/QinConst;->GetChannelID(Ljava/lang/String;)V

    .line 54
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkSIM()V

    .line 55
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkChannel()V

    .line 56
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkExtSDK()V

    .line 57
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkChannelName()V

    .line 58
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkMobileSplash()V

    .line 59
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkChannelSplash()V

    .line 60
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkLoge()V

    .line 61
    invoke-virtual {p0}, Lcom/east2west/game/SdkApplication;->JSXML()V

    .line 62
    invoke-direct {p0}, Lcom/east2west/game/SdkApplication;->checkNumber()V

    .line 66
    :try_start_0
    invoke-direct {p0, p0}, Lcom/east2west/game/SdkApplication;->getSign(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/east2west/game/SdkApplication;->key:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 71
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 73
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[SDKApp]SdkName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/east2west/game/SdkApplication;->msg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IAP"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    sget-object v0, Lcom/east2west/game/SdkApplication;->iscarriersneed:Ljava/lang/String;

    const-string v1, "open"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    sget-object v0, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v1, "telecom"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/east2west/game/E2WApp;->SortChannelID:Ljava/lang/String;

    const-string v1, "unicom"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "megjb"

    .line 77
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public parseSignature([B)V
    .locals 2

    :try_start_0
    const-string v0, "X.509"

    .line 154
    invoke-static {v0}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v0

    .line 155
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 156
    invoke-virtual {v0, v1}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object p1

    check-cast p1, Ljava/security/cert/X509Certificate;

    .line 157
    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 158
    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object p1

    invoke-virtual {p1}, Ljava/math/BigInteger;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 161
    invoke-virtual {p1}, Ljava/security/cert/CertificateException;->printStackTrace()V

    :goto_0
    return-void
.end method
