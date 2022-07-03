.class Lcom/east2west/game/inApp/InAppDefault$2;
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

    .line 182
    iput-object p1, p0, Lcom/east2west/game/inApp/InAppDefault$2;->this$0:Lcom/east2west/game/inApp/InAppDefault;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 185
    iget-object p1, p0, Lcom/east2west/game/inApp/InAppDefault$2;->this$0:Lcom/east2west/game/inApp/InAppDefault;

    invoke-virtual {p1}, Lcom/east2west/game/inApp/InAppDefault;->CarriersPay()V

    return-void
.end method
