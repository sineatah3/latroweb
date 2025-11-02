.class public final Ly/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly/e;
.implements Ljava/io/Serializable;


# instance fields
.field private final d:Ly/e;

.field private final e:Ly/e$b;


# direct methods
.method public constructor <init>(Ly/e;Ly/e$b;)V
    .locals 1

    .line 1
    const-string v0, "left"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "element"

    invoke-static {p2, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly/c;->d:Ly/e;

    iput-object p2, p0, Ly/c;->e:Ly/e$b;

    return-void
.end method

.method private final a(Ly/e$b;)Z
    .locals 1

    .line 1
    invoke-interface {p1}, Ly/e$b;->getKey()Ly/e$c;

    move-result-object v0

    invoke-virtual {p0, v0}, Ly/c;->get(Ly/e$c;)Ly/e$b;

    move-result-object v0

    invoke-static {v0, p1}, Le0/d;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method private final b(Ly/c;)Z
    .locals 1

    .line 1
    :goto_0
    iget-object v0, p1, Ly/c;->e:Ly/e$b;

    invoke-direct {p0, v0}, Ly/c;->a(Ly/e$b;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p1, Ly/c;->d:Ly/e;

    instance-of v0, p1, Ly/c;

    if-eqz v0, :cond_1

    check-cast p1, Ly/c;

    goto :goto_0

    :cond_1
    const-string v0, "null cannot be cast to non-null type kotlin.coroutines.CoroutineContext.Element"

    invoke-static {p1, v0}, Le0/d;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Ly/e$b;

    invoke-direct {p0, p1}, Ly/c;->a(Ly/e$b;)Z

    move-result p1

    return p1
.end method

.method private final c()I
    .locals 3

    .line 1
    const/4 v0, 0x2

    move-object v1, p0

    :goto_0
    iget-object v1, v1, Ly/c;->d:Ly/e;

    instance-of v2, v1, Ly/c;

    if-eqz v2, :cond_0

    check-cast v1, Ly/c;

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :goto_1
    if-nez v1, :cond_1

    return v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    if-eq p0, p1, :cond_1

    instance-of v0, p1, Ly/c;

    if-eqz v0, :cond_0

    check-cast p1, Ly/c;

    invoke-direct {p1}, Ly/c;->c()I

    move-result v0

    invoke-direct {p0}, Ly/c;->c()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-direct {p1, p0}, Ly/c;->b(Ly/c;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public fold(Ljava/lang/Object;Ld0/b;)Ljava/lang/Object;
    .locals 1

    .line 1
    const-string v0, "operation"

    invoke-static {p2, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Ly/c;->d:Ly/e;

    invoke-interface {v0, p1, p2}, Ly/e;->fold(Ljava/lang/Object;Ld0/b;)Ljava/lang/Object;

    move-result-object p1

    iget-object v0, p0, Ly/c;->e:Ly/e$b;

    invoke-interface {p2, p1, v0}, Ld0/b;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public get(Ly/e$c;)Ly/e$b;
    .locals 2

    .line 1
    const-string v0, "key"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, p0

    :goto_0
    iget-object v1, v0, Ly/c;->e:Ly/e$b;

    invoke-interface {v1, p1}, Ly/e$b;->get(Ly/e$c;)Ly/e$b;

    move-result-object v1

    if-eqz v1, :cond_0

    return-object v1

    :cond_0
    iget-object v0, v0, Ly/c;->d:Ly/e;

    instance-of v1, v0, Ly/c;

    if-eqz v1, :cond_1

    check-cast v0, Ly/c;

    goto :goto_0

    :cond_1
    invoke-interface {v0, p1}, Ly/e;->get(Ly/e$c;)Ly/e$b;

    move-result-object p1

    return-object p1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ly/c;->d:Ly/e;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-object v1, p0, Ly/c;->e:Ly/e$b;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public minusKey(Ly/e$c;)Ly/e;
    .locals 2

    .line 1
    const-string v0, "key"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Ly/c;->e:Ly/e$b;

    invoke-interface {v0, p1}, Ly/e$b;->get(Ly/e$c;)Ly/e$b;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Ly/c;->d:Ly/e;

    return-object p1

    :cond_0
    iget-object v0, p0, Ly/c;->d:Ly/e;

    invoke-interface {v0, p1}, Ly/e;->minusKey(Ly/e$c;)Ly/e;

    move-result-object p1

    iget-object v0, p0, Ly/c;->d:Ly/e;

    if-ne p1, v0, :cond_1

    move-object p1, p0

    goto :goto_0

    :cond_1
    sget-object v0, Ly/f;->d:Ly/f;

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Ly/c;->e:Ly/e$b;

    goto :goto_0

    :cond_2
    new-instance v0, Ly/c;

    iget-object v1, p0, Ly/c;->e:Ly/e$b;

    invoke-direct {v0, p1, v1}, Ly/c;-><init>(Ly/e;Ly/e$b;)V

    move-object p1, v0

    :goto_0
    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ""

    sget-object v2, Ly/c$a;->e:Ly/c$a;

    invoke-virtual {p0, v1, v2}, Ly/c;->fold(Ljava/lang/Object;Ld0/b;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
