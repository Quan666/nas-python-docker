from wakeonlan import send_magic_packet
from fastapi import FastAPI

app = FastAPI()


@app.get("/wake")
async def wake(mac: str = "", ip: str = "255.255.255.255", port: int = 9):
    send_magic_packet(mac, ip_address=ip, port=port)
    return {"message": "Wake up!", "mac": mac, "ip": ip, "port": port}


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="0.0.0.0", port=8001)
