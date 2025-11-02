.class public abstract Ly/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly/e$b;


# instance fields
.field private final key:Ly/e$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ly/e$c;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ly/e$c;)V
    .locals 1

    .line 1
    const-string v0, "key"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly/a;->key:Ly/e$c;

    return-void
.end method


# virtual methods
.method public fold(Ljava/lang/Object;Ld0/b;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "Ld0/b;",
            ")TR;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1, p2}, Ly/e$b$a;->a(Ly/e$b;Ljava/lang/Object;Ld0/b;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public get(Ly/e$c;)Ly/e$b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Ly/e$b;",
            ">(",
            "Ly/e$c;",
            ")TE;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ly/e$b$a;->b(Ly/e$b;Ly/e$c;)Ly/e$b;

    move-result-object p1

    return-object p1
.end method

.method public getKey()Ly/e$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ly/e$c;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ly/a;->key:Ly/e$c;

    return-object v0
.end method

.method public minusKey(Ly/e$c;)Ly/e;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ly/e$c;",
            ")",
            "Ly/e;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ly/e$b$a;->c(Ly/e$b;Ly/e$c;)Ly/e;

    move-result-object p1

    return-object p1
.end method

.method public plus(Ly/e;)Ly/e;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ly/e$b$a;->d(Ly/e$b;Ly/e;)Ly/e;

    move-result-object p1

    return-object p1
.end method
