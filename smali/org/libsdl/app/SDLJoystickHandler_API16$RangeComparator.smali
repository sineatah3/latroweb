.class Lorg/libsdl/app/SDLJoystickHandler_API16$RangeComparator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/libsdl/app/SDLJoystickHandler_API16;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RangeComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/view/InputDevice$MotionRange;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/view/InputDevice$MotionRange;Landroid/view/InputDevice$MotionRange;)I
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result p1

    invoke-virtual {p2}, Landroid/view/InputDevice$MotionRange;->getAxis()I

    move-result p2

    const/16 v0, 0x17

    const/16 v1, 0x16

    if-ne p1, v1, :cond_0

    const/16 p1, 0x17

    goto :goto_0

    :cond_0
    if-ne p1, v0, :cond_1

    const/16 p1, 0x16

    :cond_1
    :goto_0
    if-ne p2, v1, :cond_2

    const/16 p2, 0x17

    goto :goto_1

    :cond_2
    if-ne p2, v0, :cond_3

    const/16 p2, 0x16

    :cond_3
    :goto_1
    const/16 v0, 0xe

    const/16 v1, 0xd

    const/16 v2, 0xb

    if-ne p1, v2, :cond_4

    const/16 p1, 0xd

    goto :goto_2

    :cond_4
    if-le p1, v2, :cond_5

    if-ge p1, v0, :cond_5

    add-int/lit8 p1, p1, -0x1

    :cond_5
    :goto_2
    if-ne p2, v2, :cond_6

    const/16 p2, 0xd

    goto :goto_3

    :cond_6
    if-le p2, v2, :cond_7

    if-ge p2, v0, :cond_7

    add-int/lit8 p2, p2, -0x1

    :cond_7
    :goto_3
    sub-int/2addr p1, p2

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 2
    check-cast p1, Landroid/view/InputDevice$MotionRange;

    check-cast p2, Landroid/view/InputDevice$MotionRange;

    invoke-virtual {p0, p1, p2}, Lorg/libsdl/app/SDLJoystickHandler_API16$RangeComparator;->compare(Landroid/view/InputDevice$MotionRange;Landroid/view/InputDevice$MotionRange;)I

    move-result p1

    return p1
.end method
