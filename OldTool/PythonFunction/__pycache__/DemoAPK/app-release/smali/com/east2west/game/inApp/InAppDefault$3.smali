.class Lcom/east2west/game/inApp/InAppDefault$3;
.super Ljava/lang/Object;
.source "InAppDefault.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/east2west/game/inApp/InAppDefault;->DoublePay()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/east2west/game/inApp/InAppDefault;


# direct methods
.method constructor <init>(Lcom/east2west/game/inApp/InAppDefault;)V
    .locals 0

    .line 188
    iput-object p1, p0, Lcom/east2west/game/inApp/InAppDefault$3;->this$0:Lcom/east2west/game/inApp/InAppDefault;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 191
    iget-object p2, p0, Lcom/east2west/game/inApp/InAppDefault$3;->this$0:Lcom/east2west/game/inApp/InAppDefault;

    invoke-static {p2}, Lcom/east2west/game/inApp/InAppDefault;->access$000(Lcom/east2west/game/inApp/InAppDefault;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/east2west/game/inApp/InAppDefault;->onPurchaseFailed(Ljava/lang/String;)V

    .line 192
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method
