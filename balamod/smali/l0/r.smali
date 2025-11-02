.class public abstract Ll0/r;
.super Ll0/c;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll0/r$a;
    }
.end annotation


# static fields
.field public static final e:Ll0/r$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll0/r$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ll0/r$a;-><init>(Le0/b;)V

    sput-object v0, Ll0/r;->e:Ll0/r$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ll0/c;-><init>()V

    return-void
.end method
