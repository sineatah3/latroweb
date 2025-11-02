.class public abstract Lf0/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lf0/c$a;
    }
.end annotation


# static fields
.field public static final d:Lf0/c$a;

.field private static final e:Lf0/c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lf0/c$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lf0/c$a;-><init>(Le0/b;)V

    sput-object v0, Lf0/c;->d:Lf0/c$a;

    sget-object v0, Lz/b;->a:Lz/a;

    invoke-virtual {v0}, Lz/a;->b()Lf0/c;

    move-result-object v0

    sput-object v0, Lf0/c;->e:Lf0/c;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic a()Lf0/c;
    .locals 1

    .line 1
    sget-object v0, Lf0/c;->e:Lf0/c;

    return-object v0
.end method


# virtual methods
.method public abstract b()I
.end method
