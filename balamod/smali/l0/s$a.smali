.class public final Ll0/s$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly/e$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll0/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field static final synthetic a:Ll0/s$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll0/s$a;

    invoke-direct {v0}, Ll0/s$a;-><init>()V

    sput-object v0, Ll0/s$a;->a:Ll0/s$a;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
