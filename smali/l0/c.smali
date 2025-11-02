.class public abstract Ll0/c;
.super Ly/a;
.source "SourceFile"

# interfaces
.implements Ly/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll0/c$a;
    }
.end annotation


# static fields
.field public static final d:Ll0/c$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll0/c$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ll0/c$a;-><init>(Le0/b;)V

    sput-object v0, Ll0/c;->d:Ll0/c$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    sget-object v0, Ly/d;->c:Ly/d$b;

    invoke-direct {p0, v0}, Ly/a;-><init>(Ly/e$c;)V

    return-void
.end method


# virtual methods
.method public abstract a(Ly/e;Ljava/lang/Runnable;)V
.end method

.method public b(Ly/e;)Z
    .locals 0

    .line 1
    const/4 p1, 0x1

    return p1
.end method

.method public c(I)Ll0/c;
    .locals 1

    .line 1
    invoke-static {p1}, Ln0/d;->a(I)V

    new-instance v0, Ln0/c;

    invoke-direct {v0, p0, p1}, Ln0/c;-><init>(Ll0/c;I)V

    return-object v0
.end method

.method public get(Ly/e$c;)Ly/e$b;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ly/d$a;->a(Ly/d;Ly/e$c;)Ly/e$b;

    move-result-object p1

    return-object p1
.end method

.method public minusKey(Ly/e$c;)Ly/e;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ly/d$a;->b(Ly/d;Ly/e$c;)Ly/e;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ll0/g;->a(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {p0}, Ll0/g;->b(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
