.class final Ly/e$a$a;
.super Le0/e;
.source "SourceFile"

# interfaces
.implements Ld0/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ly/e$a;->a(Ly/e;Ly/e;)Ly/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation


# static fields
.field public static final e:Ly/e$a$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ly/e$a$a;

    invoke-direct {v0}, Ly/e$a$a;-><init>()V

    sput-object v0, Ly/e$a$a;->e:Ly/e$a$a;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Le0/e;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ly/e;

    check-cast p2, Ly/e$b;

    invoke-virtual {p0, p1, p2}, Ly/e$a$a;->c(Ly/e;Ly/e$b;)Ly/e;

    move-result-object p1

    return-object p1
.end method

.method public final c(Ly/e;Ly/e$b;)Ly/e;
    .locals 3

    .line 1
    const-string v0, "acc"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "element"

    invoke-static {p2, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p2}, Ly/e$b;->getKey()Ly/e$c;

    move-result-object v0

    invoke-interface {p1, v0}, Ly/e;->minusKey(Ly/e$c;)Ly/e;

    move-result-object p1

    sget-object v0, Ly/f;->d:Ly/f;

    if-ne p1, v0, :cond_0

    goto :goto_1

    :cond_0
    sget-object v1, Ly/d;->c:Ly/d$b;

    invoke-interface {p1, v1}, Ly/e;->get(Ly/e$c;)Ly/e$b;

    move-result-object v2

    check-cast v2, Ly/d;

    if-nez v2, :cond_1

    new-instance v0, Ly/c;

    invoke-direct {v0, p1, p2}, Ly/c;-><init>(Ly/e;Ly/e$b;)V

    :goto_0
    move-object p2, v0

    goto :goto_1

    :cond_1
    invoke-interface {p1, v1}, Ly/e;->minusKey(Ly/e$c;)Ly/e;

    move-result-object p1

    if-ne p1, v0, :cond_2

    new-instance p1, Ly/c;

    invoke-direct {p1, p2, v2}, Ly/c;-><init>(Ly/e;Ly/e$b;)V

    move-object p2, p1

    goto :goto_1

    :cond_2
    new-instance v0, Ly/c;

    new-instance v1, Ly/c;

    invoke-direct {v1, p1, p2}, Ly/c;-><init>(Ly/e;Ly/e$b;)V

    invoke-direct {v0, v1, v2}, Ly/c;-><init>(Ly/e;Ly/e$b;)V

    goto :goto_0

    :goto_1
    return-object p2
.end method
