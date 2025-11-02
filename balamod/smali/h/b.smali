.class public abstract Lh/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lh/b$c;,
        Lh/b$f;,
        Lh/b$d;,
        Lh/b$b;,
        Lh/b$a;,
        Lh/b$e;
    }
.end annotation


# instance fields
.field d:Lh/b$c;

.field private e:Lh/b$c;

.field private f:Ljava/util/WeakHashMap;

.field private g:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lh/b;->f:Ljava/util/WeakHashMap;

    const/4 v0, 0x0

    iput v0, p0, Lh/b;->g:I

    return-void
.end method


# virtual methods
.method public a()Ljava/util/Iterator;
    .locals 3

    .line 1
    new-instance v0, Lh/b$b;

    iget-object v1, p0, Lh/b;->e:Lh/b$c;

    iget-object v2, p0, Lh/b;->d:Lh/b$c;

    invoke-direct {v0, v1, v2}, Lh/b$b;-><init>(Lh/b$c;Lh/b$c;)V

    iget-object v1, p0, Lh/b;->f:Ljava/util/WeakHashMap;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public b()Ljava/util/Map$Entry;
    .locals 1

    .line 1
    iget-object v0, p0, Lh/b;->d:Lh/b$c;

    return-object v0
.end method

.method protected abstract c(Ljava/lang/Object;)Lh/b$c;
.end method

.method public d()Lh/b$d;
    .locals 3

    .line 1
    new-instance v0, Lh/b$d;

    invoke-direct {v0, p0}, Lh/b$d;-><init>(Lh/b;)V

    iget-object v1, p0, Lh/b;->f:Ljava/util/WeakHashMap;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public e()Ljava/util/Map$Entry;
    .locals 1

    .line 1
    iget-object v0, p0, Lh/b;->e:Lh/b$c;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lh/b;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lh/b;

    invoke-virtual {p0}, Lh/b;->size()I

    move-result v1

    invoke-virtual {p1}, Lh/b;->size()I

    move-result v3

    if-eq v1, v3, :cond_2

    return v2

    :cond_2
    invoke-virtual {p0}, Lh/b;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-virtual {p1}, Lh/b;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    if-nez v3, :cond_4

    if-nez v4, :cond_5

    :cond_4
    if-eqz v3, :cond_3

    invoke-interface {v3, v4}, Ljava/util/Map$Entry;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    :cond_5
    return v2

    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_7

    goto :goto_0

    :cond_7
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected f(Ljava/lang/Object;Ljava/lang/Object;)Lh/b$c;
    .locals 1

    .line 1
    new-instance v0, Lh/b$c;

    invoke-direct {v0, p1, p2}, Lh/b$c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget p1, p0, Lh/b;->g:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lh/b;->g:I

    iget-object p1, p0, Lh/b;->e:Lh/b$c;

    if-nez p1, :cond_0

    iput-object v0, p0, Lh/b;->d:Lh/b$c;

    :goto_0
    iput-object v0, p0, Lh/b;->e:Lh/b$c;

    return-object v0

    :cond_0
    iput-object v0, p1, Lh/b$c;->c:Lh/b$c;

    iput-object p1, v0, Lh/b$c;->d:Lh/b$c;

    goto :goto_0
.end method

.method public g(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lh/b;->c(Ljava/lang/Object;)Lh/b$c;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    iget v1, p0, Lh/b;->g:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lh/b;->g:I

    iget-object v1, p0, Lh/b;->f:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lh/b;->f:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lh/b$f;

    invoke-interface {v2, p1}, Lh/b$f;->a(Lh/b$c;)V

    goto :goto_0

    :cond_1
    iget-object v1, p1, Lh/b$c;->d:Lh/b$c;

    iget-object v2, p1, Lh/b$c;->c:Lh/b$c;

    if-eqz v1, :cond_2

    iput-object v2, v1, Lh/b$c;->c:Lh/b$c;

    goto :goto_1

    :cond_2
    iput-object v2, p0, Lh/b;->d:Lh/b$c;

    :goto_1
    iget-object v2, p1, Lh/b$c;->c:Lh/b$c;

    if-eqz v2, :cond_3

    iput-object v1, v2, Lh/b$c;->d:Lh/b$c;

    goto :goto_2

    :cond_3
    iput-object v1, p0, Lh/b;->e:Lh/b$c;

    :goto_2
    iput-object v0, p1, Lh/b$c;->c:Lh/b$c;

    iput-object v0, p1, Lh/b$c;->d:Lh/b$c;

    iget-object p1, p1, Lh/b$c;->b:Ljava/lang/Object;

    return-object p1
.end method

.method public hashCode()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lh/b;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0

    :cond_0
    return v1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 3

    .line 1
    new-instance v0, Lh/b$a;

    iget-object v1, p0, Lh/b;->d:Lh/b$c;

    iget-object v2, p0, Lh/b;->e:Lh/b$c;

    invoke-direct {v0, v1, v2}, Lh/b$a;-><init>(Lh/b$c;Lh/b$c;)V

    iget-object v1, p0, Lh/b;->f:Ljava/util/WeakHashMap;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public size()I
    .locals 1

    .line 1
    iget v0, p0, Lh/b;->g:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lh/b;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
