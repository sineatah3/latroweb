.class final Ll0/c$a$a;
.super Le0/e;
.source "SourceFile"

# interfaces
.implements Ld0/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll0/c$a;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation


# static fields
.field public static final e:Ll0/c$a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll0/c$a$a;

    invoke-direct {v0}, Ll0/c$a$a;-><init>()V

    sput-object v0, Ll0/c$a$a;->e:Ll0/c$a$a;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Le0/e;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic b(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ly/e$b;

    invoke-virtual {p0, p1}, Ll0/c$a$a;->c(Ly/e$b;)Ll0/c;

    move-result-object p1

    return-object p1
.end method

.method public final c(Ly/e$b;)Ll0/c;
    .locals 1

    .line 1
    instance-of v0, p1, Ll0/c;

    if-eqz v0, :cond_0

    check-cast p1, Ll0/c;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method
