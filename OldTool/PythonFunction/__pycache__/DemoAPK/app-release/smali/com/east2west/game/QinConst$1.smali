.class Lcom/east2west/game/QinConst$1;
.super Ljava/lang/Object;
.source "QinConst.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/east2west/game/QinConst;->Exchange(Lcom/east2west/game/inApp/InAppBase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/east2west/game/QinConst;

.field final synthetic val$inbase:Lcom/east2west/game/inApp/InAppBase;

.field final synthetic val$inputServer:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/east2west/game/QinConst;Landroid/widget/EditText;Lcom/east2west/game/inApp/InAppBase;)V
    .locals 0

    .line 431
    iput-object p1, p0, Lcom/east2west/game/QinConst$1;->this$0:Lcom/east2west/game/QinConst;

    iput-object p2, p0, Lcom/east2west/game/QinConst$1;->val$inputServer:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/east2west/game/QinConst$1;->val$inbase:Lcom/east2west/game/inApp/InAppBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 434
    new-instance p1, Ljava/lang/Thread;

    new-instance p2, Lcom/east2west/game/QinConst$1$1;

    invoke-direct {p2, p0}, Lcom/east2west/game/QinConst$1$1;-><init>(Lcom/east2west/game/QinConst$1;)V

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 492
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method
