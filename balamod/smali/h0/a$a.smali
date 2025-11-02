.class public final Lh0/a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lh0/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Le0/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lh0/a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(III)Lh0/a;
    .locals 1

    .line 1
    new-instance v0, Lh0/a;

    invoke-direct {v0, p1, p2, p3}, Lh0/a;-><init>(III)V

    return-object v0
.end method
