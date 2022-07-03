.class Lcom/east2west/game/E2WApp$4;
.super Ljava/lang/Object;
.source "E2WApp.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/east2west/game/E2WApp;->Exchange(Lcom/east2west/game/inApp/APPBaseInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/east2west/game/E2WApp;


# direct methods
.method constructor <init>(Lcom/east2west/game/E2WApp;)V
    .locals 0

    .line 335
    iput-object p1, p0, Lcom/east2west/game/E2WApp$4;->this$0:Lcom/east2west/game/E2WApp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 338
    new-instance v0, Lcom/east2west/game/inApp/InAppBase;

    invoke-direct {v0}, Lcom/east2west/game/inApp/InAppBase;-><init>()V

    return-void
.end method
