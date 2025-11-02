.class public abstract Lw/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lw/d$a;,
        Lw/d$b;
    }
.end annotation


# static fields
.field public static final d:Lw/d$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lw/d$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lw/d$a;-><init>(Le0/b;)V

    sput-object v0, Lw/d;->d:Lw/d$a;

    return-void
.end method

.method public static a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static final b(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lw/d$b;

    return p0
.end method

.method public static final c(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lw/d$b;

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method
